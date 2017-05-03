from django.http import JsonResponse
from django.views.generic import TemplateView
import json


class IndexView(TemplateView):
    template_name = "other/index.html"


def my_round(data):
    return round(data, 0)


def process_object(request):
    data = json.loads(request.body)

    # trim off all comments
    # concatenate all lines (replace '\n' with '')
    # remove semicolon
    # split by comma -- keep old fields available
    # relevant fields:
    #  0: make sure it is OS:Table:MultiVariableLookup
    #  1: handle
    #  29: number of indep vars
    #  for 2 indep vars:
    #    num_rows: (total_count - 30)/(num_indep_vars + 1) = in this example = (36-30)/(2+1) = 6/3 = 2 check.
    #    x1 30, x2 31, y 32; then x1 33, x2 34, y 35
    # find all x1 values, all x2 values
    # for each x1 value, make sure there are matching (x1, x2) for each x2, if not then this x1 is out
    # will we need to do this for x2 also?
    # at the end, we'll have a list of valid x1 and x2, use this to generate the final rows
    # rewrite the object, without comments
    data_lines = data['string'].split('\n')
    cleaned_data_lines = []
    for line in data_lines:
        if line.find('!') > 0:
            cleaned_data_lines.append(line.split('!')[0].strip())
        else:
            cleaned_data_lines.append(line.strip())
    cleaned_contents = ''.join(cleaned_data_lines)
    no_semicolon_contents = cleaned_contents.split(';')[0]
    original_tokens = no_semicolon_contents.split(',')
    num_indep_vars = int(original_tokens[29])
    if num_indep_vars != 2:
        return JsonResponse({'status': 'error: this function currently only does 2 indep var objects'})
    num_tokens = len(original_tokens)
    num_rows = (num_tokens - 30) / (num_indep_vars + 1)
    data_rows = []
    row_counter = 29
    for data_row in range(num_rows):
        row_counter += 1
        this_data_row = [float(original_tokens[row_counter])]
        for var_row in range(num_indep_vars):
            row_counter += 1
            this_data_row.append(float(original_tokens[row_counter]))
        data_rows.append(this_data_row)
    x1_values = sorted(list(set([my_round(x[0]) for x in data_rows])))
    x2_values = sorted(list(set([my_round(x[1]) for x in data_rows])))
    # loop over just x1 and keep only the values that contain all x2 values
    x1_vals_to_keep = []
    log_messages = ""
    for x1_val in x1_values:
        data_rows_for_this_x1 = [data_row for data_row in data_rows if my_round(data_row[0]) == x1_val]
        keep_this_x1_val = True
        for x2_val in x2_values:
            matching_data_points = [data_row for data_row in data_rows_for_this_x1 if my_round(data_row[1]) == x2_val]
            if matching_data_points:
                continue
            else:
                keep_this_x1_val = False
                log_messages += "\nRemoving x1 value {0} because it doesn't contain all x2 values".format(my_round(x1_val))
                break
        if keep_this_x1_val:
            x1_vals_to_keep.append(x1_val)
            log_messages += "\nKeeping x1 value {0}".format(my_round(x1_val))
    final_dataset = [data_row for data_row in data_rows if my_round(data_row[0]) in x1_vals_to_keep]
    out_message = ""
    for i in range(30):
        if i > 0:
            out_message += "    "
        out_message += original_tokens[i] + ',\n'
    for row in final_dataset:
        try:
            out_message += "    {0},\n    {1},\n    {2},\n".format(row[0], row[1], row[2])
        except Exception as e:
            return JsonResponse({'status': 'error', 'result': str(e)})
    # replace the last character (comma) with semicolon
    out_message = out_message[:-1]
    out_message += ';'
    return JsonResponse({'result': out_message, 'log': log_messages})

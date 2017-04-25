# Processing Schemas

BuildingSync schemas are xsd.  From this schema there are several paths that can be taken.

## Manual Processing

We could manually parse out the content of the xsd file.  This is exceedingly burdensome, and there are parsers available already, albeit they do way more than we need.

## Getting to HTML

A schema, stylesheet ([xs3p](https://xml.fiforms.org/xs3p/)), and xls processor ([xsltproc](http://xmlsoft.org/XSLT/xsltproc2.html)) walk into a bar.  HTML comes out.

```bash
$ xsltproc xs3p.xsl BuildingSync_2_0.xsd > BuildingSync_2_0.html
```

## Getting to Python classes

A pretty sweet data structure generator, [generateDS](https://bitbucket.org/dkuhlman/generateds) is available via pip, and can be used to generate Python classes for each entity in the xsd.
The only real problem is that this comes with an **amazing** amount of overhead in the class structures, when all I really want to do is identify the members.
Even stripping away all the getters and setters with the following command, it is still very large, but could provide a path forward.

```bash
$ generateds -o classes.py --use-getter-setter=none BuildingSync_2_0.xsd
```

## Plan

The goal of this task is to come up with a tree of the audit entry in buildingsync.  We could eventually make it super nice like you just upload a schema and it does lots of magic.
That is what HPXMLWebApp does.  But I think for our case, we can get away with preprocessing a building sync schema file locally and deploying a preprocessed something.  Whatever that is.

So, what should we do?  We really just want to create the tree of items, with checkboxes on each item.  So why not parse out the structure into json?
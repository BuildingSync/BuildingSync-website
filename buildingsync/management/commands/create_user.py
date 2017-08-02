from django.contrib.auth.models import User
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    def add_arguments(self, parser):
        # Positional arguments
        parser.add_argument('username', type=str)
        parser.add_argument('email', type=str)
        parser.add_argument('password', type=str)

    def handle(self, *args, **options):
        print("Creating new user with username:email {}:{} with a password".format(
            options['username'], options['email']
        ))

        # Check if the user already exists
        if not User.objects.filter(username=options['username']).exists():
            user = User.objects.create_superuser(
                options['username'], options['email'], options['password']
            )
            user.save()
        else:
            print("User {}:{} already exists".format(options['username'], options['email']))

# Generated by Django 3.1.4 on 2021-02-02 19:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('kosin_proses', '0006_auto_20210101_0919'),
    ]

    operations = [
        migrations.CreateModel(
            name='tf',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('kata', models.CharField(max_length=225)),
                ('frequency', models.IntegerField(default=0)),
            ],
        ),
    ]

{% test assert_column_doesnt_contain_value_2(model, column_name) %}
    select count(*) as num_records from {{ model }} where {{ column_name }} = 2
{% endtest %}

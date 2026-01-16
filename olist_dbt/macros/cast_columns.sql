{% macro cast_to_timestamp(column_names) %}
    {% for column in column_names %}
        cast({{ column }} as timestamp) as {{ column | replace('_timestamp', '_at') | replace('_date', '_at') | replace('order_', '') }}
        {%- if not loop.last -%}, {% endif -%}
    {% endfor %}
{% endmacro %}
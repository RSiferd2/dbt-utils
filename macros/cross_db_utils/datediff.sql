{% macro datediff(first_date, second_date, datepart) %}
  {{ adapter_macro('dbt_utils.datediff', first_date, second_date, datepart) }}
{% endmacro %}


{% macro default__datediff(first_date, second_date, datepart) %}

    datediff(
        {{ datepart }},
        {{ first_date }},
        {{ second_date }}
        )

{% endmacro %}


{% macro bigquery__datediff(first_date, second_date, datepart) %}

    date_diff(
        {{second_date}},
        {{first_date}},
        {{datepart}}
        )

{% endmacro %}


{% macro postgres__datediff(first_date, second_date, datepart) %}

    {{ exceptions.raise_compiler_error("macro datediff not implemented for this adapter") }}

{% endmacro %}

{% macro get_season(x) %}
CASE WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12, 1, 2) THEN 'winter' WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3, 4, 5) THEN 'spring' WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6, 7, 8) THEN 'summer' ELSE 'autumn' END
{% endmacro %}

{% macro get_daytype(x) %}
    CASE WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat', 'Sun') THEN 'weekend' ELSE 'businessday' END
{% endmacro %}
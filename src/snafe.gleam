import gleam/option.{None}
import snafe/runner
import snafe/statistics
import snafe/units

/// Example of requesting data for a School unit
pub fn main() {
  let school_unit = "68326694"
  echo runner.run(units.get_school_unit("", school_unit, None))
  echo runner.run(statistics.get_school_unit_stats_by_code("", school_unit))
}

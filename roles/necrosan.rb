name "necrosan"
description "Master role applied to necrosan"

default_attributes(
  :networking => {
    :interfaces => {
      :external_ipv4 => {
        :interface => "bond0",
        :mtu => 9000,
        :role => :external,
        :family => :inet,
        :address => "45.85.134.91",
        :prefix => "31",
        :gateway => "45.85.134.90",
        :bond => {
          :slaves => %w[eno1 eno2],
          :mode => "802.3ad",
          :lacprate => "fast"
        }
      },
      :external_ipv6 => {
        :interface => "bond0",
        :role => :external,
        :family => :inet6,
        :address => "2a05:46c0:100:1004:ffff:ffff:ffff:ffff",
        :prefix => "64",
        :gateway => "2a05:46c0:100:1004::"
      }
    }
  },
  :sysfs => {
    :hdd_tune => {
      :comment => "Tune the queue for improved performance",
      :parameters => {
        "block/sda/queue/nr_requests" => "975",
        "block/sdb/queue/rotational" => "0"
      }
    }
  }
)

run_list(
  "role[appliwave]"
)

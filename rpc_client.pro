QT -= gui
QT += concurrent

CONFIG += console
CONFIG -= app_bundle

DEFINES += QT_DEPRECATED_WARNINGS

QMAKE_CXXFLAGS += -std=c++17

INCLUDEPATH += /opt/grpc-install/include/
LIBS += -L/opt/grpc-install/lib -lgrpc++ -lgrpc -laddress_sorting -lre2 -lupb -lcares -lz -lgpr -lssl -lcrypto -labsl_raw_hash_set -labsl_hashtablez_sampler -labsl_hash -labsl_city -labsl_low_level_hash -labsl_random_distributions -labsl_random_seed_sequences -labsl_random_internal_pool_urbg -labsl_random_internal_randen -labsl_random_internal_randen_hwaes -labsl_random_internal_randen_hwaes_impl -labsl_random_internal_randen_slow -labsl_random_internal_platform -labsl_random_internal_seed_material -labsl_random_seed_gen_exception -labsl_statusor -labsl_status -labsl_cord -labsl_cordz_info -labsl_cord_internal -labsl_cordz_functions -labsl_exponential_biased -labsl_cordz_handle -labsl_bad_optional_access -labsl_str_format_internal -labsl_synchronization -labsl_graphcycles_internal -labsl_stacktrace -labsl_symbolize -labsl_debugging_internal -labsl_demangle_internal -labsl_malloc_internal -labsl_time -labsl_civil_time -labsl_strings -labsl_strings_internal -lrt -labsl_base -labsl_spinlock_wait -labsl_int128 -labsl_throw_delegate -labsl_time_zone -labsl_bad_variant_access -labsl_raw_logging_internal -labsl_log_severity -lprotobuf

SRCDIR = "rpc_client_cpp"

SOURCES += \
  $$SRCDIR/helloworld_client.cpp \
  $$SRCDIR/helloworld.grpc.pb.cc \
  $$SRCDIR/helloworld.pb.cc \

HEADERS += \
  $$SRCDIR/helloworld.grpc.pb.h \
  $$SRCDIR/helloworld.pb.h \

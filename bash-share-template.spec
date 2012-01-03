Name: bashshare
Version: {version}
Release: 1
Source: bashshare-{version}.tar.gz
Vendor: Alexander Trousevich
Summary: Collection of bash scripts, allowing quick mounting of network shares
Group: admin/scripts
License: GNU GPL
BuildRoot: %{_tmppath}/BUILDROOT

%description
Collection of bash scripts, allowing quick mounting of network shares

%package bashcompletion
Summary: bash-completion scripts for bash-share
Group: admin/scripts
Requires: bashshare
%description bashcompletion
bash-completion scripts for bash-share

%prep
%setup

%build
echo No build required

%install
rm -rf $RPM_BUILD_ROOT/
make DESTDIR=$RPM_BUILD_ROOT install install-bash-completion

%clean
rm -rf $RPM_BIULD_ROOT

%files
/usr/*

%files bashcompletion
/etc/bash_completion.d/*
Name: bashshare
Version: 0.1
Release: 1
Source: bashshare-0.1.tar.gz
Vendor: Alexander Trousevich
Summary: Collection of bash scripts, allowing quick mounting of network shares
Group: admin/scripts
License: GNU GPL
BuildRoot: %{_tmppath}/BUILDROOT

%description
Collection of bash scripts, allowing quick mounting of network shares

%prep
%setup

%build
echo No build required

%install
rm -rf $RPM_BUILD_ROOT/
make DESTDIR=$RPM_BUILD_ROOT install

%clean
rm -rf $RPM_BIULD_ROOT

%files
/*

Subject: Beaglebone Black Ethernet Failures
To: meta-ti@lists.yoctoproject.org
From: "Dave Tucker" <theaethereal@gmail.com>
X-Originating-Location: Washington, US (154.3.44.17)
X-Originating-Platform: Linux Firefox 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 10 Mar 2021 05:27:22 -0800
Message-ID: <u0TL.1615382842912667990.O2ud@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="sYL5DjBOmP45TVSr6MFU"

--sYL5DjBOmP45TVSr6MFU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have been using a Beaglebone Black for a project for years.=C2=A0 I recen=
tly upgraded from Dunfell to Gatesgarth and again began experiencing a prob=
lem with the ethernet interface failing to come online 10% of the time, a p=
roblem which can only be fixed by a power cycle (not a reboot).=C2=A0 This =
is a well known problem documented by this thread ( https://groups.google.c=
om/g/beagleboard/c/9mctrG26Mc8 ) going back over 7 years.=C2=A0 It's a hard=
ware problem, but it does have a software fix.=C2=A0 But that fix must have=
 been left out of recent meta-bbb builds.=C2=A0 I believe previous fixes ha=
ve been something like this patch ( https://github.com/RobertCNelson/bb-ker=
nel/blob/607ae2e36477357a4bb222f285fd7460d5230ab9/patches/net/0009-cpsw-sea=
rch-for-phy.patch ).=C2=A0 That old patch targets the 3.15 kernel and I bel=
ieve Gatesgarth is using 5.10.=C2=A0 Should I expect that patch to work unm=
odified on 5.10?=C2=A0 I don't know low level kernel mechanics well enough =
to understand what it's really doing.=C2=A0 If that patch won't work, does =
anyone know how I could proceed to get ethernet working on the Beaglebone B=
lack with current versions of Yocto?

Dave

--sYL5DjBOmP45TVSr6MFU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have been using a Beaglebone Black for a project for years.&nbsp; I recen=
tly upgraded from Dunfell to Gatesgarth and again began experiencing a prob=
lem with the ethernet interface failing to come online 10% of the time, a p=
roblem which can only be fixed by a power cycle (not a reboot).&nbsp; This =
is a well known problem documented by <a title=3D"Beaglebone Black Ethernet=
 Phy Not Detected on Boot" href=3D"https://groups.google.com/g/beagleboard/=
c/9mctrG26Mc8" target=3D"_blank" rel=3D"noopener">this thread</a> going bac=
k over 7 years.&nbsp; It's a hardware problem, but it does have a software =
fix.&nbsp; But that fix must have been left out of recent meta-bbb builds.&=
nbsp; I believe previous fixes have been something like <a href=3D"https://=
github.com/RobertCNelson/bb-kernel/blob/607ae2e36477357a4bb222f285fd7460d52=
30ab9/patches/net/0009-cpsw-search-for-phy.patch" target=3D"_blank" rel=3D"=
noopener">this patch</a>.&nbsp; That old patch targets the 3.15 kernel and =
I believe Gatesgarth is using 5.10.&nbsp; Should I expect that patch to wor=
k unmodified on 5.10?&nbsp; I don't know low level kernel mechanics well en=
ough to understand what it's really doing.&nbsp; If that patch won't work, =
does anyone know how I could proceed to get ethernet working on the Beagleb=
one Black with current versions of Yocto?<br /><br />Dave

--sYL5DjBOmP45TVSr6MFU--

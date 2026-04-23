Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B68FAD414
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 05:20:27 +0000 (UTC)
Subject: Re: [master][PATCH] am62lxx-evm: Override serial console to ttyS0 only
To: meta-ti@lists.yoctoproject.org
From: "Yogesh Hegde" <y-hegde@ti.com>
X-Originating-Location: IN (103.146.116.10)
X-Originating-Platform: Linux Firefox 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 22 Apr 2026 22:20:27 -0700
References: <20260422062227.4098420-1-y-hegde@ti.com> <1bcfb891-a9c4-4371-9ccf-3bdec183e4e0@ti.com> <34b97b71-e4bf-4cd8-ad14-2aa909aeb4c2@ti.com>
In-Reply-To: <34b97b71-e4bf-4cd8-ad14-2aa909aeb4c2@ti.com>
Message-ID: <1033533.1776921627670364945@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Apr 2026 05:20:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19872

On Wed, Apr 22, 2026 at 11:14 PM, Andrew Davis wrote:

>
> On 4/22/26 1:53 AM, Hari Prasath via lists.yoctoproject.org wrote:
> > On 22/04/26 11:52 am, Yogesh Hegde via lists.yoctoproject.org wrote:
> >> The am62lxx-evm board only has ttyS0 available. The k3 default
> >> SERIAL_CONSOLES inherited includes ttyS2, which causes
> >> systemd to wait indefinitely for a console that never appears,
> >> significantly increasing boot time and degrading user experience.
> >>
> >> Override SERIAL_CONSOLES to specify only ttyS0, allowing the boot
> >> process to proceed normally without waiting for unavailable consoles.
> >>
> >> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
> >=20
> > Assuming this is only an am62lxx-evm only constraint and not at a SoC l=
evel,
> this override in machine conf looks good to me.
> >=20
>=20
> AM62L does not have ttyS2, so this is needed for all AM62L based boards.
>=20
> So this might be good to move to include/am62lxx.inc.
>=20
> Andrew
>=20

Thanks for confirming this will send a v2 moving this change to include/am6=
2lxx.inc

Yogesh

> > Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> >=20
> >=20
> >> ---
> >>
> >> Boot time is increased from 33s to 2m18s.
> >> Boot time is measured from power on to TI LVGL demo
> >> running on HDMI Display.
> >>
> >> Logs:
> >>
> >> root@am62lxx-evm:~# systemd-analyze critical-chain ti-lvgl-demo.servic=
e
> >> The time when unit became active or started is printed after the "@"
> character.
> >> The time the unit took to start is printed after the "+" character.
> >> ti-lvgl-demo.service @1min 32.588s
> >> `-multi-user.target @1min 32.577s
> >> =C2=A0=C2=A0 `-getty.target @1min 32.575s
> >> =C2=A0=C2=A0=C2=A0=C2=A0 `-serial-getty@ttyS0.service @13.002s
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-systemd-user-sessions.service @=
10.847s +660ms
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-network.target @10.=
582s
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-systemd=
-networkd.service @8.748s +1.799s
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 `-network-pre.target @8.735s
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 `-iptables.service @7.477s +920ms
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-basic.target @7.363s
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-dbus-broker.service @6.661s +466m=
s
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-dbus.socket @6.310s +=
434us
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `-sysinit.t=
arget @6.263s
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> `-systemd-vconsole-setup.service @18.198s +391ms
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> `-systemd-journald.socket @2.781s +335us
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 `-system.slice
> @1.282s
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `--.slice
> @1.282s
> >>
> >> =C2=A0From the time analysis log, `getty.target` takes 1min 32 secs to=
 bootup
> due to
> >> serial-getty@ttyS2.service failed. This service fails because there is=
 no
> >> hardware associated with ttyS2.
> >>
> >> ---
> >> =C2=A0 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 ++
> >> =C2=A0 1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> >> index 677d6955..edfb4057 100644
> >> --- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> >> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> >> @@ -4,6 +4,8 @@
> >> =C2=A0 require conf/machine/include/am62lxx.inc
> >> +SERIAL_CONSOLES =3D "115200;ttyS0"
> >> +
> >> =C2=A0 IMAGE_FSTYPES +=3D "ubifs ubi"
> >> =C2=A0 MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 12000"
> >>
> >>
> >>
> >>
> >>
> >=20
> >=20
> >=20
> >=20
> >=20
>=20
>


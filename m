Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B52C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:01:26 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.17758.1677661275298109720
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1 header.b=erZnM/+q;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677661275; x=1709197275;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7LiQGjEgwj5NCwDMouTtSzuStjHZGrto5ARSXD8Acmk=;
  b=erZnM/+q7ZNjtQf+K9UmOBeTkph5zDAClNrXzbyer/cbLOeMQLiugyc0
   mfc8GFs5R8HOjz30XXleASnPoCJU7ag4bjFwc+SunJOrVCalJwERThcFz
   JNUX2k/i6J1dDsxBkLSYLpQmKBLC1Gvk4uz5X8ymhRaZ91X8DU21ujK50
   PpEUlzeEE/l+yw5e9qIlfqQdk++gVyEluwXZ95zI1XDmdX/rxg26zt4oG
   66M+Kqzd8S7wVKZky6WlMUcM2G0A6wqtBGQm8I++hLosnCPWpOoIBVWAd
   IO9FtElu9lRdg8gXMWlq5RgwuBawUdl5rpKCnR/vPFGeVvhQyeMp879I0
   g==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673910000"; 
   d="scan'208";a="29388555"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 01 Mar 2023 10:01:12 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 01 Mar 2023 10:01:12 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 01 Mar 2023 10:01:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677661272; x=1709197272;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7LiQGjEgwj5NCwDMouTtSzuStjHZGrto5ARSXD8Acmk=;
  b=V+oJEnRttSoGA3DEIOHaQ+bhWO6f+QnDsTvr54ClJ3A4ALpKLIZJWvpY
   c565tDxybJ3coky5CN1h1TnhfYdqYgKq+aJiI7pTWA9SpmpkQTHtg3Cpa
   IZeHfDwTnfN0OzJeLdgLmnkFkbAJOOXhRvZgKmlavoEqqQAhFOlUkqjI7
   /QfgJTzz4dS2T0brEHCOJIy8E2ms5NKdiQ7ri8iDuj42kYCWCBEn8etvX
   X/vATYzIKLJLDqt9qpo2BhoQzX+5k6HUsRf2BDwFhEYvDKX26kvwFiF1I
   TJ8T6MlppOikkmK5pMoaOVm2rRkAnJMvkglQIajDxf/6Yb1iRwz4yAoyt
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,224,1673910000"; 
   d="scan'208";a="29388553"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 01 Mar 2023 10:01:12 +0100
Received: from [192.168.2.129] (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 91C31280056;
	Wed,  1 Mar 2023 10:01:11 +0100 (CET)
Message-ID: <d06ed7242d5cb5905eba0f4a98ed176eb50320bf.camel@ew.tq-group.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] ti-sgx-ddk-um: use udev
 for userspace initialization
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Date: Wed, 01 Mar 2023 10:01:09 +0100
In-Reply-To: <20230301012631.GP22689@denix.org>
References: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
	 <20221216130139.20841-2-matthias.schiffer@ew.tq-group.com>
	 <20221219210029.GU22689@denix.org>
	 <38b94bc6ee2f585eddbe7461ecd1d02f4ced08ab.camel@ew.tq-group.com>
	 <20230223013826.GJ22689@denix.org>
	 <8a4e2f08109cd05d5b364b8cf716b96d745919c7.camel@ew.tq-group.com>
	 <20230301012631.GP22689@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15965

On Tue, 2023-02-28 at 20:26 -0500, Denys Dmytriyenko wrote:
> On Thu, Feb 23, 2023 at 10:20:12AM +0100, Matthias Schiffer wrote:
> > On Wed, 2023-02-22 at 20:38 -0500, Denys Dmytriyenko wrote:
> > > So, testing the latest patch series, I started getting breakage on al=
l SGX=20
> > > platforms:
> > >=20
> > > WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst=
 returned 1, marking as unpacked only, configuration required on target.
> > > ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets o=
f ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first=
 boot,
> > > then please place them into pkg_postinst_ontarget:${PN} ().
> > > Deferring to first boot via 'exit 1' is no longer supported.
> > > Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-def=
ault-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp=
/log.do_rootfs.
> > > ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-=
tmp-default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-=
r0/temp/log.do_rootfs.156835
> > > ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro=
/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit cod=
e '1'
> > >=20
> > >=20
> > > WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst=
 returned 1, marking as unpacked only, configuration required on target.
> > > ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets o=
f ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first=
 boot,
> > > then please place them into pkg_postinst_ontarget:${PN} ().
> > > Deferring to first boot via 'exit 1' is no longer supported.
> > > Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-def=
ault-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp=
/log.do_rootfs.
> > > ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-=
tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-=
r0/temp/log.do_rootfs.164346
> > > ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro=
/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit cod=
e '1'
> > >=20
> > >=20
> > > WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst=
 returned 1, marking as unpacked only, configuration required on target.
> > > ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets o=
f ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to first=
 boot,
> > > then please place them into pkg_postinst_ontarget:${PN} ().
> > > Deferring to first boot via 'exit 1' is no longer supported.
> > > Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-def=
ault-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_=
rootfs.
> > > ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-=
tmp-default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/=
log.do_rootfs.159785
> > > ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro=
/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit cod=
e '1'
> > >=20
> > >=20
> > > Reverting this commit helps with the build:
> > > https://git.yoctoproject.org/meta-ti/commit/?h=3Dkirkstone&id=3Df50f5=
5102f926ba58ea22339a98e4239370af6c6
> > >=20
> > >=20
> > > So far I didn't have time to dig deeper, though it's not obvious righ=
t away...
> > >=20
> >=20
> > Hi Denys,
> >=20
> > I assume that the failing postinst script must come from update-
> > rc.d.bbclass, but without knowing what command in the script is failing
> > it's difficult to say anything for certain. Would it be possible for
> > you to make a ti-sgx-ddk-um RPM or similar from the failing build
> > available for us to have a look at?
> >=20
> > What DISTRO_FEATURES is your build using? sysvinit, no systemd?
>=20
> Matthias,
>=20
> This is default Arago distro with both systemd and sysvinit in the=20
> DISTRO_FEATURES, and it generates IPKs. I looked at the corresponding=20
> postinst scripts and didn't see anything obvious.
>=20
> Unfortunately, I didn't have time to debug that further and had to=20
> switch to graphics updates. Part of it was updating SGX UM recipe=20
> and forcing rebuild, so I haven't seen any breakage since then.
>=20
> I might try reshuffling my patch queue in order to reproduce it, if I=20
> have time, to see if it was due to stale sstate or something similar.
>=20

Hi Denys,

I believe I have seen stale sstate issues with postinst scripts before.

IIRC, something like adding "unset pkg_postinst_ontarget_${PN}" to a
bbappend didn't trigger a rebuild, but I never got around to check
whether the bug was caused by postinst(_ontarget), unset, or a
combination of both. According to my Git log, this must have been on
WRL LTS18 / Yocto Thud though, so what you're seeing might also be an
entirely different issue...

Best regards,
Matthias


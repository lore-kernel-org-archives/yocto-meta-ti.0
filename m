Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CB2C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 09:20:28 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.6852.1677144017698693154
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 01:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1 header.b=bzU7lAlz;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677144017; x=1708680017;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=o0UttdP5SXeJwsX+LfstBqjtMegxX4pKnr9H8AfcrYM=;
  b=bzU7lAlzf04IyB9ZncrklwWDakhD9sy3qHyUucfMjqrIKbogG2f+T7wE
   U+N0Szi4aS9MVai9FjYHErvx6LAd09lWyj/9iXf3rtX0K8O92WFdKc5EP
   x+T/4BXBtcSNnWCC9xUL1YAJRMKoAgETa4CIqY6UJBwbTFIrRJ1Ilt/XV
   7bKQPORaciuzRsm1zkVDkbCBBJJ4sDm8OO2oPNIdMhaax8oaAN+/rxVHB
   E517NXf5LiIOCBspBTsnIR+YlpNSCIFzAaBSd3RST3Q+o1OYKVU1WrlIs
   /mefdtf8lCvJ09ySNiNRBgUfvNYw2poFMSZ3gYQDCV1+fx+rzFS3V99nN
   A==;
X-IronPort-AV: E=Sophos;i="5.97,320,1669071600"; 
   d="scan'208";a="29266731"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Feb 2023 10:20:15 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 23 Feb 2023 10:20:15 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 23 Feb 2023 10:20:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677144015; x=1708680015;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=o0UttdP5SXeJwsX+LfstBqjtMegxX4pKnr9H8AfcrYM=;
  b=m7XpbyCtpoKxvpMeUsBcewA7oITED9/0/CrvQnvQYm1s2s38h7B8Fi3h
   rPO1i69j8XKZuoMDzu9FhTQBc4fHmD8+JL8yabtJ+htWqSKRVbT/mLJXO
   wgjckc4QS7E8JotMn90KMEGT4h51QM5jc16N4lZcgL+IBs7UGpmkeATIz
   5oLSA8HXOg6ctEFybnUpVxz7qA8M23d/vdkNQHwZqIQqQV+Z0Kqqo8U1r
   7dIHFjnSReWlookTVhiA2crnNz0nzM5w9js3WHH2lXni/kv7ruP37j/9z
   MNmWIbFxi0j+B3jFo/GKceeyD4AmEKS6J19ssoDZI5BtD2J36IJHsi3M4
   w==;
X-IronPort-AV: E=Sophos;i="5.97,320,1669071600"; 
   d="scan'208";a="29266730"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Feb 2023 10:20:15 +0100
Received: from [192.168.2.129] (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id E39B9280056;
	Thu, 23 Feb 2023 10:20:14 +0100 (CET)
Message-ID: <8a4e2f08109cd05d5b364b8cf716b96d745919c7.camel@ew.tq-group.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] ti-sgx-ddk-um: use udev
 for userspace initialization
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Date: Thu, 23 Feb 2023 10:20:12 +0100
In-Reply-To: <20230223013826.GJ22689@denix.org>
References: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
	 <20221216130139.20841-2-matthias.schiffer@ew.tq-group.com>
	 <20221219210029.GU22689@denix.org>
	 <38b94bc6ee2f585eddbe7461ecd1d02f4ced08ab.camel@ew.tq-group.com>
	 <20230223013826.GJ22689@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Feb 2023 09:20:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15929

On Wed, 2023-02-22 at 20:38 -0500, Denys Dmytriyenko wrote:
> So, testing the latest patch series, I started getting breakage on all SG=
X=20
> platforms:
>=20
> WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst ret=
urned 1, marking as unpacked only, configuration required on target.
> ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['=
ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boo=
t,
> then please place them into pkg_postinst_ontarget:${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default=
-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log=
.do_rootfs.
> ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-=
default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/t=
emp/log.do_rootfs.156835
> ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/rec=
ipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1=
'
>=20
>=20
> WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst ret=
urned 1, marking as unpacked only, configuration required on target.
> ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['=
ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boo=
t,
> then please place them into pkg_postinst_ontarget:${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default=
-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/temp/log=
.do_rootfs.
> ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-=
default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/t=
emp/log.do_rootfs.164346
> ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/rec=
ipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1=
'
>=20
>=20
> WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.postinst ret=
urned 1, marking as unpacked only, configuration required on target.
> ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['=
ti-sgx-ddk-um'] have failed. If the intention is to defer them to first boo=
t,
> then please place them into pkg_postinst_ontarget:${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> Details of the failure are in /OE/arago-kirkstone/build/arago-tmp-default=
-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.do_root=
fs.
> ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/arago-tmp-=
default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log.=
do_rootfs.159785
> ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-distro/rec=
ipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit code '1=
'
>=20
>=20
> Reverting this commit helps with the build:
> https://git.yoctoproject.org/meta-ti/commit/?h=3Dkirkstone&id=3Df50f55102=
f926ba58ea22339a98e4239370af6c6
>=20
>=20
> So far I didn't have time to dig deeper, though it's not obvious right aw=
ay...
>=20

Hi Denys,

I assume that the failing postinst script must come from update-
rc.d.bbclass, but without knowing what command in the script is failing
it's difficult to say anything for certain. Would it be possible for
you to make a ti-sgx-ddk-um RPM or similar from the failing build
available for us to have a look at?

What DISTRO_FEATURES is your build using? sysvinit, no systemd?

Best regards,
Matthias


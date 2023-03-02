Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83F3C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 09:47:38 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.11210.1677750453377802054
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 01:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=HkQ6D+d9;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677750453; x=1709286453;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=yvgeP2I+6mk61PluaP1yX1kZIDzCXy3KUjiMQ/NdG7o=;
  b=HkQ6D+d98wR0SxRU6VOLYNK1vj6sIBGHIarZ2UHIVx1tuAtIDyQeiMtv
   nphU+rW8siPwGpncAt962IzS53Sw7Ui+FduEXGml2+A61OKZFoyG3V9//
   08zsEjlKFbFtch4ghnKf7ATp3j0UQ+AuJRVMFGYbO4O0CKeREz62fdWaS
   Fg4DzyYObRVnZDZ8a06ujZkMc8fH0xYxqw65qptX0ERCH72xqLBBF2vel
   WSeidxWJKfG8wCNspigEGEvcsXONgAbErFcw0A9g1wMN0eVav8x6gh1cz
   qoqbd6LZt18pHxqbMms0b267kOFheqwZ+CgAbnvkSG3YHs2IRA7VFX8vM
   A==;
X-IronPort-AV: E=Sophos;i="5.98,227,1673910000"; 
   d="scan'208";a="29419526"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Mar 2023 10:47:31 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 02 Mar 2023 10:47:31 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 02 Mar 2023 10:47:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677750451; x=1709286451;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=yvgeP2I+6mk61PluaP1yX1kZIDzCXy3KUjiMQ/NdG7o=;
  b=m9mozDA6wR4MyHKaoAXuCwu8ueqS8ungJ2qUBi2Vyg3HG/yFr7tra1hq
   XQJpA9rHyYCnhM6F7s4mFowmFiI6LhtyTYqOT1MtcoIFlcNIAGtJu6cIH
   ymsZ709NM3t9SEMkuL/DL6dPa/pMItaAKRqdRRwLBdkwpd31Ohv4cMriq
   gQL1eSl2yIxLT5HZLjjvEGODeCNDH88yaH6RqkNWJyccU0BruBh0rU/fZ
   IW1T6m556mFqVZADm7nFI1FF2BTGR5kU+fet7ct4l90Kzv98an3eByTlg
   EyNGdPvQSGo32Vwj0pEUvDTnjDLDXEdVsdE7Cn1/Dz7yLVSyue/xYubfP
   w==;
X-IronPort-AV: E=Sophos;i="5.98,227,1673910000"; 
   d="scan'208";a="29419525"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Mar 2023 10:47:31 +0100
Received: from [192.168.2.129] (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 18233280056;
	Thu,  2 Mar 2023 10:47:31 +0100 (CET)
Message-ID: <007504298d670b56cdc01323fce6356595f9ff63.camel@ew.tq-group.com>
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] ti-sgx-ddk-um: use udev
 for userspace initialization
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Davis <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denis@denix.org>
Date: Thu, 02 Mar 2023 10:47:28 +0100
In-Reply-To: <e474b1dc-888c-d73e-fcb7-d87a805706a5@ti.com>
References: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
	 <20221216130139.20841-2-matthias.schiffer@ew.tq-group.com>
	 <20221219210029.GU22689@denix.org>
	 <38b94bc6ee2f585eddbe7461ecd1d02f4ced08ab.camel@ew.tq-group.com>
	 <20230223013826.GJ22689@denix.org>
	 <8a4e2f08109cd05d5b364b8cf716b96d745919c7.camel@ew.tq-group.com>
	 <20230301012631.GP22689@denix.org>
	 <d06ed7242d5cb5905eba0f4a98ed176eb50320bf.camel@ew.tq-group.com>
	 <e474b1dc-888c-d73e-fcb7-d87a805706a5@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Mar 2023 09:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15971

On Wed, 2023-03-01 at 15:48 -0600, Andrew Davis wrote:
> On 3/1/23 3:01 AM, Matthias Schiffer wrote:
> > On Tue, 2023-02-28 at 20:26 -0500, Denys Dmytriyenko wrote:
> > > On Thu, Feb 23, 2023 at 10:20:12AM +0100, Matthias Schiffer wrote:
> > > > On Wed, 2023-02-22 at 20:38 -0500, Denys Dmytriyenko wrote:
> > > > > So, testing the latest patch series, I started getting breakage o=
n all SGX
> > > > > platforms:
> > > > >=20
> > > > > WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.post=
inst returned 1, marking as unpacked only, configuration required on target=
.
> > > > > ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptle=
ts of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to f=
irst boot,
> > > > > then please place them into pkg_postinst_ontarget:${PN} ().
> > > > > Deferring to first boot via 'exit 1' is no longer supported.
> > > > > Details of the failure are in /OE/arago-kirkstone/build/arago-tmp=
-default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/=
temp/log.do_rootfs.
> > > > > ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/ar=
ago-tmp-default-glibc/work/am335x_evm-oe-linux-gnueabi/tisdk-default-image/=
1.0-r0/temp/log.do_rootfs.156835
> > > > > ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-di=
stro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit=
 code '1'
> > > > >=20
> > > > >=20
> > > > > WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.post=
inst returned 1, marking as unpacked only, configuration required on target=
.
> > > > > ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptle=
ts of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to f=
irst boot,
> > > > > then please place them into pkg_postinst_ontarget:${PN} ().
> > > > > Deferring to first boot via 'exit 1' is no longer supported.
> > > > > Details of the failure are in /OE/arago-kirkstone/build/arago-tmp=
-default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/1.0-r0/=
temp/log.do_rootfs.
> > > > > ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/ar=
ago-tmp-default-glibc/work/am57xx_evm-oe-linux-gnueabi/tisdk-default-image/=
1.0-r0/temp/log.do_rootfs.164346
> > > > > ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-di=
stro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit=
 code '1'
> > > > >=20
> > > > >=20
> > > > > WARNING: tisdk-default-image-1.0-r0 do_rootfs: ti-sgx-ddk-um.post=
inst returned 1, marking as unpacked only, configuration required on target=
.
> > > > > ERROR: tisdk-default-image-1.0-r0 do_rootfs: Postinstall scriptle=
ts of ['ti-sgx-ddk-um'] have failed. If the intention is to defer them to f=
irst boot,
> > > > > then please place them into pkg_postinst_ontarget:${PN} ().
> > > > > Deferring to first boot via 'exit 1' is no longer supported.
> > > > > Details of the failure are in /OE/arago-kirkstone/build/arago-tmp=
-default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/temp/log=
.do_rootfs.
> > > > > ERROR: Logfile of failure stored in: /OE/arago-kirkstone/build/ar=
ago-tmp-default-glibc/work/am65xx_evm-oe-linux/tisdk-default-image/1.0-r0/t=
emp/log.do_rootfs.159785
> > > > > ERROR: Task (/OE/arago-kirkstone/sources/meta-arago/meta-arago-di=
stro/recipes-core/images/tisdk-default-image.bb:do_rootfs) failed with exit=
 code '1'
> > > > >=20
> > > > >=20
> > > > > Reverting this commit helps with the build:
> > > > > https://git.yoctoproject.org/meta-ti/commit/?h=3Dkirkstone&id=3Df=
50f55102f926ba58ea22339a98e4239370af6c6
> > > > >=20
> > > > >=20
> > > > > So far I didn't have time to dig deeper, though it's not obvious =
right away...
> > > > >=20
> > > >=20
> > > > Hi Denys,
> > > >=20
> > > > I assume that the failing postinst script must come from update-
> > > > rc.d.bbclass, but without knowing what command in the script is fai=
ling
> > > > it's difficult to say anything for certain. Would it be possible fo=
r
> > > > you to make a ti-sgx-ddk-um RPM or similar from the failing build
> > > > available for us to have a look at?
> > > >=20
> > > > What DISTRO_FEATURES is your build using? sysvinit, no systemd?
> > >=20
> > > Matthias,
> > >=20
> > > This is default Arago distro with both systemd and sysvinit in the
> > > DISTRO_FEATURES, and it generates IPKs. I looked at the corresponding
> > > postinst scripts and didn't see anything obvious.
> > >=20
> > > Unfortunately, I didn't have time to debug that further and had to
> > > switch to graphics updates. Part of it was updating SGX UM recipe
> > > and forcing rebuild, so I haven't seen any breakage since then.
> > >=20
> > > I might try reshuffling my patch queue in order to reproduce it, if I
> > > have time, to see if it was due to stale sstate or something similar.
> > >=20
> >=20
> > Hi Denys,
> >=20
> > I believe I have seen stale sstate issues with postinst scripts before.
> >=20
> > IIRC, something like adding "unset pkg_postinst_ontarget_${PN}" to a
> > bbappend didn't trigger a rebuild, but I never got around to check
> > whether the bug was caused by postinst(_ontarget), unset, or a
> > combination of both. According to my Git log, this must have been on
> > WRL LTS18 / Yocto Thud though, so what you're seeing might also be an
> > entirely different issue...
> >=20
>=20
> I'm getting the error with a clean sstate. Seem it is related to
> update-rc.d. We should *not* inherit this class unless we have
> something deployed to init.d/ but your patch removes those files
> in the default case and so update-rc.d fails.
>=20
> inherit ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'update-rc.d'=
, '', d)}
>=20
> Seems to help, but only handles the case when sysvinit is not used,
> not the case when udev in PACKAGECONFIG causes the initscript to be
> removed. That might require some more complex check.
>=20
> Andrew

Ugh. I thought I had specifically verified that inheriting the class is
fine even when the script is removed. I'll try to look into this as
soon as possible, but I might not be able to make time before next
week.

Best regards,
Matthias



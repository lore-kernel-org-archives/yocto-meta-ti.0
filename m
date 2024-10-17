Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D0ED374AB
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 15:29:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.757.1729178952277221180
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 08:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6916D40CFC;
	Thu, 17 Oct 2024 15:29:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsOvT843_e17; Thu, 17 Oct 2024 15:29:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2291E40CE5;
	Thu, 17 Oct 2024 15:29:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4A9511640B9; Thu, 17 Oct 2024 11:29:06 -0400 (EDT)
Date: Thu, 17 Oct 2024 11:29:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
	meta-ti@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>, rogerio.borin@toradex.com
Subject: Re: [meta-ti] [master/scarthgap][PATCH] conf: machine: k3: use
 weak assignment for FIT image variables
Message-ID: <20241017152906.GA20070@denix.org>
References: <20241014202746.1818435-1-sergio.prado@e-labworks.com>
 <17FF06D0FF79DF51.9153@lists.yoctoproject.org>
 <37ac5b62-3fcd-49b8-9320-bd50acc4df51@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <37ac5b62-3fcd-49b8-9320-bd50acc4df51@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Oct 2024 15:29:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18010

On Wed, Oct 16, 2024 at 04:35:17PM -0500, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
>=20
>=20
> On 10/16/2024 2:51 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> >On 10/14/2024 3:27 PM, Sergio Prado wrote:
> >>Use weak assignment to make it possible to override the default
> >>value via classes parsed after the machine configuration file.
> >>
> >>This is the case when using the tdxref-signed class from
> >>meta-toradex-security to generated signed images for AM6X.
> >>
> >>Additionally, explicitly set FIT_SIGN_NUMBITS to 4096 to align with t=
he
> >>default rsa4096 algorithm, preventing potential mismatches between th=
e
> >>signing algorithm and key length.
> >>
> >>Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> >>Signed-off-by: Rogerio Borin <rogerio.borin@toradex.com>
> >>---
> >>=A0 meta-ti-bsp/conf/machine/include/k3.inc | 9 +++++----
> >>=A0 1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/include/k3.inc
> >>b/meta-ti-bsp/conf/machine/include/k3.inc
> >>index a296f64fa141..07f0bcb48bfc 100644
> >>--- a/meta-ti-bsp/conf/machine/include/k3.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/k3.inc
> >>@@ -26,10 +26,11 @@ UBOOT_SUFFIX =3D "img"
> >>=A0 UBOOT_SIGN_ENABLE =3D "1"
> >>=A0 UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb"
> >>-UBOOT_SIGN_KEYNAME ?=3D "custMpk"
> >>-UBOOT_SIGN_KEYDIR ?=3D "${TI_SECURE_DEV_PKG}/keys"
> >>-FIT_HASH_ALG ?=3D "sha512"
> >>-FIT_SIGN_ALG ?=3D "rsa4096"
> >>+UBOOT_SIGN_KEYNAME ??=3D "custMpk"
> >>+UBOOT_SIGN_KEYDIR ??=3D "${TI_SECURE_DEV_PKG}/keys"
> >>+FIT_HASH_ALG ??=3D "sha512"
> >>+FIT_SIGN_ALG ??=3D "rsa4096"
> >>+FIT_SIGN_NUMBITS ??=3D "4096"
> >
> >These changes appear to break the build flow.=A0 Since the the only
> >real change is the addition of FIT_SIGN_NUMBITS, I'm going to
> >assume that is the culprit.
> >
> >Signature written to '<snip>/build/arago-tmp-default-glibc/work/am62ax=
x_evm-oe-linux/u-boot-ti-staging/2024.04+git/build/fitImage-linux',
> >node
> >'/configurations/conf-ti_k3-v3link-imx219-0-2.dtbo/signature-1'
> >Public key written to 'u-boot.dtb', node '/signature/key-custMpk'
> >Signature check bad (error 1)
> >Verifying Hash Integrity for node 'conf-ti_k3-am62a7-sk.dtb'...
> >sha256,rsa2048:custMpk-
> > =A0error!
> >Verification failed for '(null)' hash node in
> >'conf-ti_k3-am62a7-sk.dtb' config node
> >Failed to verify required signature 'key-custMpk'
>=20
> I think the issue is that the weak assignment happens at the very
> end of parsing if there no other value for the variable.  But the
> various classes (kernel-fitimage.bbclass, uboot-sign.bbclass,
> etc...) set the variables using the ?=3D so that means the values we
> want for our stuff never gets set correctly.
>=20
> I can see how this works for you in your case, but doing this in
> meta-ti-bsp breaks everyone not using meta-tordex-security.
>=20
> I'm not really sure the best solution for this.  Should the tordex
> layer be in final control of these variables and not allow
> overrides?  Should it not be using the ?=3D assignment and instead use
> the =3D assignment to force the issue?
>=20
> Denys,
> Any ideas?

Yeah, I had my suspicions about the patch, so not surprised by your=20
confirmation. I'd suggest using machine or SoC overrides in toradex=20
layer to change the defaults set in meta-ti k3.inc

--=20
Denys


Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA11C7619A
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 00:18:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.43154.1680221890259035809
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 17:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9620640C5D;
	Fri, 31 Mar 2023 00:18:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEjdztEXpkvp; Fri, 31 Mar 2023 00:18:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 645CF40C24;
	Fri, 31 Mar 2023 00:18:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 348BE1637E5; Thu, 30 Mar 2023 20:17:31 -0400 (EDT)
Date: Thu, 30 Mar 2023 20:17:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/4] trusted-firmware-a:
 Only sign files for platforms that support it
Message-ID: <20230331001731.GD18050@denix.org>
References: <20230330212440.19437-1-reatmon@ti.com>
 <20230330212440.19437-3-reatmon@ti.com>
 <1751589DE6D33C0C.27612@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1751589DE6D33C0C.27612@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 00:18:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16272

On Thu, Mar 30, 2023 at 08:12:10PM -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 30, 2023 at 04:24:38PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> > We are seeing some testing issues where the new code that signs all of
> > the files at all times is causing issues.  So rollback the logic and
> > only sign for platforms that support it.
> 
> This is unfortunate that am65x GP has a bug/feature and fails to boot with 
> signed images. Hopefully this can be resolved soon, otherwise it will block 
> combining GP and HS-SE/HS-FS builds into one platform with multiconfig. 
> Especially this one, ironically:
> https://patchwork.yoctoproject.org/project/ti/patch/20230321110742.26379-1-p-bhagat@ti.com/
> 
> As we discussed offline, I'm fine with this as a temporary workaround for now.

And forgot to ack, d'oh :facepalm:


> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> > ---
> >  .../trusted-firmware-a_%.bbappend             | 40 ++++++++++++++++++-
> >  1 file changed, 38 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > index 9b8dd142..c65ecd9c 100644
> > --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> > @@ -12,12 +12,48 @@ inherit ti-secdev
> >  EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
> >  EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
> >  
> > -# Signing procedure for K3 devices
> > -do_compile:append:k3() {
> > +# Signing procedure for K3 HS devices
> > +tfa_sign_k3hs() {
> >  	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
> >  	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
> >  }
> >  
> > +do_compile:append:am65xx-hs-evm() {
> > +    tfa_sign_k3hs
> > +}
> > +
> > +do_compile:append:am64xx-evm() {
> > +    tfa_sign_k3hs
> > +}
> > +
> > +do_compile:append:am62xx-evm() {
> > +    tfa_sign_k3hs
> > +}
> > +
> > +do_compile:append:am62xx-lp-evm() {
> > +    tfa_sign_k3hs
> > +}
> > +
> > +do_compile:append:am62axx-evm() {
> > +    tfa_sign_k3hs
> > +}
> > +
> > +do_compile:append:j721e-hs-evm() {
> > +    tfa_sign_k3hs
> > +}
> > +
> > +do_compile:append:j7200-hs-evm() {
> > +    tfa_sign_k3hs
> > +}
> > +
> > +do_compile:append:j721s2-hs-evm() {
> > +    tfa_sign_k3hs
> > +}
> > +
> > +do_compile:append:j784s4-hs-evm() {
> > +    tfa_sign_k3hs
> > +}
> > +
> >  do_install:append:k3() {
> >      if [ -f ${BUILD_DIR}/bl31.bin.unsigned ]; then
> >          echo "Install bl31.bin.unsigned"
> > -- 
> > 2.17.1


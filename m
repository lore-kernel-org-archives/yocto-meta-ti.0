Return-Path: <michael@amarulasolutions.com>
Received: from mail-bk0-f50.google.com (mail-bk0-f50.google.com
	[209.85.214.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B296EE013E8
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 14:30:08 -0700 (PDT)
Received: by mail-bk0-f50.google.com with SMTP id ik5so533036bkc.37
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 14:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent
	:x-gm-message-state;
	bh=/QbEcCstvQQYgrvacucsLpoKXYp3RmsoolCslsljre4=;
	b=DiDUufGYJySZrQr5c2Zi/vbhPIvtSEyofNufD/4ewlOpbosQgHDkAL/lxGI7GX0x6Q
	7r+dRQT/VDu9MgPyk5+eKbYleTsv1ETNjVv5t+JPAij7KHFiSpjezOvfR1Fkahm+RDP0
	n7iXJXu1Q584SJy6RMrm3gs53XzHFKik5/oH50itfQnV5/pyOtVbXXpjBPOr/NyWeUbD
	NNVrI9/0njhXq2cJ1TgyBuKAgehF8EC/QQWhmao2GoMckomgOj8gSLgIypVWPVE4JP1s
	YLWcbIGG3BhHo9xIbLfW6sL/f5+cVtOwAMz/jpWw9kJ/w3B84CvJYqXIOpCjY/TaQrYr
	A93w==
X-Received: by 10.204.163.142 with SMTP id a14mr4891899bky.59.1374615006988;
	Tue, 23 Jul 2013 14:30:06 -0700 (PDT)
Received: from panicking (net-2-39-208-255.cust.dsl.vodafone.it.
	[2.39.208.255])
	by mx.google.com with ESMTPSA id a4sm61424511eez.0.2013.07.23.14.30.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 14:30:06 -0700 (PDT)
Date: Tue, 23 Jul 2013 23:30:00 +0200
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20130723213000.GD10067@panicking>
References: <20130723200931.GA10067@panicking> <20130723202110.GB32068@edge>
	<20130723202417.GB10067@panicking> <20130723203737.GC32068@edge>
MIME-Version: 1.0
In-Reply-To: <20130723203737.GC32068@edge>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQmY5d0T3bE8J/lTptqoaeE4tH4r1aFlpV4PhR9mjObbA5P0WhNjX5FCp0Xjm3nWFWLA714c
Cc: meta-ti@yoctoproject.org
Subject: Re: Unable to compile am180x-evm + gstreamer-ti
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jul 2013 21:30:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I have done some step

On Tue, Jul 23, 2013 at 04:37:38PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jul 23, 2013 at 10:24:17PM +0200, Michael Trimarchi wrote:
> > Hi
> > 
> > On Tue, Jul 23, 2013 at 04:21:11PM -0400, Denys Dmytriyenko wrote:
> > > On Tue, Jul 23, 2013 at 10:09:31PM +0200, Michael Trimarchi wrote:
> > > > Hi
> > > > 
> > > > I was having trouble in compilation of am180x-evm. The problem is that
> > > > I have this error:
> > > > 
> > > > Nothing PROVIDES 'ti-codecs-omapl138'. I'm using HOB right now and I
> > > > have included meta-ti repository. Any hints?
> > > 
> > > But am180x-evm is the platform without DSP, so you shouldn't use gstreamer-ti 
> > > with it.
> > > 


From fc9af73f5670f9fdc2bdfa12f3ef7ad5331187f0 Mon Sep 17 00:00:00 2001
From: Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 23 Jul 2013 23:28:31 +0200
Subject: [PATCH] Remove update-modules references since recipe has been
 removed.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 recipes-ti/dsplink/ti-dsplink.inc                  |   16 ----------------
 .../local-power-manager/ti-local-power-manager.inc |   13 -------------
 recipes-ti/syslink/ti-syslink.inc                  |   16 ----------------
 3 files changed, 45 deletions(-)

diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index ce7cbf9..fa1c9dd 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -187,22 +187,6 @@ do_install () {
 
 PACKAGES =+ "ti-dsplink-module"
 FILES_ti-dsplink-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/dsplinkk.ko" 
-RDEPENDS_ti-dsplink-module += "update-modules"
-
-pkg_postinst_ti-dsplink-module () {
-#!/bin/sh
-if [ -n "$D" ]; then
-	exit 1
-fi
-
-depmod -a
-update-modules || true
-}
-
-pkg_postrm_ti-dsplink-module () {
-#!/bin/sh
-update-modules || true
-}
 
 PACKAGES += "ti-dsplink-examples"
 RDEPENDS_ti-dsplink-examples_append = " ti-dsplink-module"
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager.inc b/recipes-ti/local-power-manager/ti-local-power-manager.inc
index 9155c76..2f2b525 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
+++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
@@ -113,19 +113,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES += "ti-lpm-module"
 FILES_ti-lpm-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/*lpm*ko"
 RDEPENDS_ti-lpm-module += "ti-dsplink-module"
-RDEPENDS_ti-lpm-module += "update-modules"
-
-pkg_postinst_ti-lpm-module_append () {
-        if [ -n "$D" ]; then
-                exit 1
-        fi
-        depmod -a
-        update-modules || true
-}
-
-pkg_postrm_ti-lpm-module_append () {
-        update-modules || true
-}
 
 PACKAGES += "ti-lpm-utils"
 RDEPENDS_ti-lpm-utils += "ti-lpm-module"
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index 04c59c1..b348f1a 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -216,22 +216,6 @@ do_install () {
 
 PACKAGES =+ "ti-syslink-module"
 FILES_ti-syslink-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/syslink.ko" 
-RDEPENDS_ti-syslink-module += "update-modules"
-
-pkg_postinst_ti-syslink-module () {
-#!/bin/sh
-if [ -n "$D" ]; then
-	exit 1
-fi
-
-depmod -a
-update-modules || true
-}
-
-pkg_postrm_ti-syslink-module () {
-#!/bin/sh
-update-modules || true
-}
 
 PACKAGES =+ "ti-syslink-examples"
 RRECOMMENDS_ti-syslink-examples_append = " ti-syslink-module"
-- 
1.7.9.5



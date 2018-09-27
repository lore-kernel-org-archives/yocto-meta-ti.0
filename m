Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72A13E00B47; Thu, 27 Sep 2018 09:41:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C101EE00720
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 09:41:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RGfl4B064496
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 11:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538066507;
	bh=2RjURZjL/ppr5mYmUcTNELR+yoEd4JXbTJmfrwIo+/A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cFx6YawdbK3hBCt+GdW+EJPbFyfA4y4/V+yBq2cxQDNM1+YFfQwlLJgp7NvIVyDJF
	Fu43+RSbXQTMYD0c3rOCvO73fIEtqog1CsD9a8BowVhoRv/+35k8ewyLcq0Xv50Jwu
	7u+etTRmWS1ZIqsX6tAavX/i0fiLsgvtddB0lZzA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RGflA5032448
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 11:41:47 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 11:41:46 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 11:41:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RGfkZm023454;
	Thu, 27 Sep 2018 11:41:46 -0500
Date: Thu, 27 Sep 2018 12:40:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180927164000.GF5026@beryl>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538061764-54977-18-git-send-email-m-radhakrishnan2@ti.com>
	<11be0964-c9ac-9a41-87a0-0e0d074058d2@ti.com>
MIME-Version: 1.0
In-Reply-To: <11be0964-c9ac-9a41-87a0-0e0d074058d2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [EXTERNAL] [rocko/master][PATCH 17/30] pm-lld-rtos: Update to version 01.04.00.05B and k3 support
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
X-List-Received-Date: Thu, 27 Sep 2018 16:41:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2018 at 12:32:12PM -0400, Jacob Stiffler wrote:
> 
> 
> On 9/27/2018 11:22 AM, Mahesh Radhakrishnan wrote:
> >Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> >---
> >  recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> >diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> >index 3e4e4f7..af3622b 100644
> >--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> >+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> >@@ -5,7 +5,7 @@ inherit ti-pdk
> >  LICENSE = "BSD-3-Clause"
> >  LIC_FILES_CHKSUM = "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
> >-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
> >+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >@@ -14,21 +14,23 @@ PM_LLD_GIT_PROTOCOL = "git"
> >  PM_LLD_GIT_BRANCH = "int_pm_am335x"
> >  PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
> >  PM_LLD_GIT_BRANCH_am57xx-evm = "master"
> >+PM_LLD_GIT_BRANCH_am65xx-evm = "master"
> 
> Please extend this to k3 as was done with the PM_LLD_SRCREV below.

I'd also suggest reversing the branches - it seems only am335x uses a special 
branch and all other platforms use master. It would be easier to have a single 
override for am335x/ti33x here.


> >  PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
> >-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05A"
> >-PM_LLD_SRCREV = "a5f12b8210ccea4b2e8848e54b4e178534771843"
> >+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05B"
> >+PM_LLD_SRCREV = "bac16125842f08d05156dccabec74947756d831b"
> >-# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.18"
> >-PM_LLD_SRCREV_dra7xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
> >-PM_LLD_SRCREV_am57xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
> >+# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.19"
> >+PM_LLD_SRCREV_dra7xx-evm = "9095c9d1b479d6d1ad483b8b0cf4568c83e599ec"
> >+PM_LLD_SRCREV_am57xx-evm = "9095c9d1b479d6d1ad483b8b0cf4568c83e599ec"
> >+PM_LLD_SRCREV_k3 = "9095c9d1b479d6d1ad483b8b0cf4568c83e599ec"
> >  BRANCH = "${PM_LLD_GIT_BRANCH}"
> >  SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> >  SRCREV = "${PM_LLD_SRCREV}"
> >-PV = "01.04.00.05A"
> >+PV = "01.04.00.05B"
> >  PR = "r0"
> >  S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
> >@@ -40,6 +42,10 @@ DEPENDS_append_ti33x = " starterware-rtos \
> >  "
> >  DEPENDS_append_ti43x = " starterware-rtos \
> >  "
> >+
> >+DEPENDS_append_k3 = " sciclient-rtos \
> >+"
> >+
> >  export PDK_PM_ROOT_PATH = "${WORKDIR}/build"
> >  export DEST_ROOT="${S}"
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


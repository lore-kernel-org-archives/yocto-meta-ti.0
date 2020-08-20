Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.110489.1597932158998647490
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Aug 2020 07:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Gz/MHbsG;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07KE2agO070232;
	Thu, 20 Aug 2020 09:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597932156;
	bh=SQPmyQx4f4SiGTWUxMjaXxLeFqiq4LTOY8ELBnvxUUc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Gz/MHbsGGLzELhTBvOFYOraBTGjjtOMGU3tuppVHcXcMIdifjY0n2gCJof4RRU/EE
	 BAiRY8xzmKHeq3X0GItSDmVETnVQ8BidjNOQTlQYvztduFMfUZZ2haLEipYA+pkjeZ
	 JptaxF6xXwgoFFP6CylOBMuyUj+mO5r8xRHvPp3o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07KE2a0R077907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Aug 2020 09:02:36 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 20
 Aug 2020 09:01:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 20 Aug 2020 09:01:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KE1DYP058880;
	Thu, 20 Aug 2020 09:01:13 -0500
Date: Thu, 20 Aug 2020 10:01:13 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [dunfell/master][PATCH 1/2] ti-rtos-metadata: add recipe to fetch and deploy metadata.inc for RTOS FW binary integration
Message-ID: <20200820140113.GB23512@beryl>
References: <1597895287-29065-1-git-send-email-denis@denix.org>
 <c2cc811f-3847-e158-4deb-e2a954e4cb13@ti.com>
MIME-Version: 1.0
In-Reply-To: <c2cc811f-3847-e158-4deb-e2a954e4cb13@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 20, 2020 at 09:59:58AM -0400, Jacob Stiffler wrote:
> 
> On 8/19/2020 11:48 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 41 ++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> >
> >diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> >new file mode 100644
> >index 0000000..985ff8a
> >--- /dev/null
> >+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
> >@@ -0,0 +1,41 @@
> >+LICENSE = "BSD-3-Clause"
> >+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
> >+
> >+COMPATIBLE_MACHINE = "k3"
> >+
> >+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >+
> >+INHIBIT_DEFAULT_DEPS = "1"
> >+
> >+inherit nopackages deploy
> >+
> >+PLAT_SFX = ""
> >+PLAT_SFX_j7 = "/j721e"
> >+PLAT_SFX_j7200-evm = "/j7200"
> >+PLAT_SFX_am65xx = "/am65xx"
> >+
> >+# Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
> >+TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
> >+TI_RTOS_METADATA_PROTOCOL ?= "git"
> >+TI_RTOS_METADATA_SRCREV ?= "2290c123a0c4ba4804d794c39532296a9c7b9587"
> >+TI_RTOS_METADATA_BRANCH ?= "master"
> >+TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
> >+TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
> >+
> >+PV = "1.0.0"
> 
> Since this may be set to AUTOREV, I would suggest adding SRCPV here. This
> will help track to exact version as well as ensure that the remote is
> checked upon each build and that the commit ID is not just cached.

Sounds good, thanks.


> >+S = "${WORKDIR}/git"
> >+
> >+SRC_URI = "${TI_RTOS_METADATA_URI};branch=${TI_RTOS_METADATA_BRANCH};protocol=${TI_RTOS_METADATA_PROTOCOL}"
> >+SRCREV = "${TI_RTOS_METADATA_SRCREV}"
> >+
> >+do_configure[noexec] = "1"
> >+do_compile[noexec] = "1"
> >+do_install[noexec] = "1"
> >+
> >+do_deploy () {
> >+	install -d ${DEPLOYDIR}
> >+	install -m 0644 ${TI_RTOS_METADATA_FILE} ${DEPLOYDIR}/
> >+}
> >+
> >+addtask deploy before do_build after do_compile
> >
> >

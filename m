Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB87BE00A9A; Tue,  4 Aug 2015 07:42:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B0EAE009CC
	for <meta-ti@yoctoproject.org>; Tue,  4 Aug 2015 07:42:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t74Eg51r016208
	for <meta-ti@yoctoproject.org>; Tue, 4 Aug 2015 09:42:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74Eg5XH020936
	for <meta-ti@yoctoproject.org>; Tue, 4 Aug 2015 09:42:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 09:42:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t74Eg5tc004375;
	Tue, 4 Aug 2015 09:42:05 -0500
Date: Tue, 4 Aug 2015 10:41:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150804144149.GN1040@edge>
References: <1438697389-7937-1-git-send-email-j-stiffler@ti.com>
	<20150804143253.GM1040@edge> <55C0CD69.2020300@ti.com>
MIME-Version: 1.0
In-Reply-To: <55C0CD69.2020300@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] ti-sysbios: Update version to 6.41.04.54
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
X-List-Received-Date: Tue, 04 Aug 2015 14:42:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 04, 2015 at 10:34:17AM -0400, Jacob Stiffler wrote:
> 
> 
> On 8/4/2015 10:32 AM, Denys Dmytriyenko wrote:
> >On Tue, Aug 04, 2015 at 10:09:49AM -0400, Jacob Stiffler wrote:
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  recipes-ti/bios/ti-sysbios_6.41.02.41.bb | 12 ------------
> >>  recipes-ti/bios/ti-sysbios_6.41.04.54.bb | 12 ++++++++++++
> >Use git-format-patch -M ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> I used "-M -C -C". This is what I got.

Hmm, try -Mnn to lower the similarity threshold...


> >>  2 files changed, 12 insertions(+), 12 deletions(-)
> >>  delete mode 100644 recipes-ti/bios/ti-sysbios_6.41.02.41.bb
> >>  create mode 100644 recipes-ti/bios/ti-sysbios_6.41.04.54.bb
> >>
> >>diff --git a/recipes-ti/bios/ti-sysbios_6.41.02.41.bb b/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
> >>deleted file mode 100644
> >>index ccc6ad1..0000000
> >>--- a/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
> >>+++ /dev/null
> >>@@ -1,12 +0,0 @@
> >>-require ti-sysbios.inc
> >>-
> >>-PV = "6_41_02_41"
> >>-PR = "r1"
> >>-
> >>-LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=a4af75ec6d586c5267c71075eebff418"
> >>-
> >>-SRC_URI[sysbiosbin.md5sum] = "65deff27110c2af87a3c71fea3c0345e"
> >>-SRC_URI[sysbiosbin.sha256sum] = "2c47b4a3aa9513d10e5811a8ac7ed1d6ce3d13df57a0bffe10d8cabaf228c76f"
> >>-
> >>-TI_BIN_UNPK_CMDS=""
> >>-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> >>diff --git a/recipes-ti/bios/ti-sysbios_6.41.04.54.bb b/recipes-ti/bios/ti-sysbios_6.41.04.54.bb
> >>new file mode 100644
> >>index 0000000..1e24fe1
> >>--- /dev/null
> >>+++ b/recipes-ti/bios/ti-sysbios_6.41.04.54.bb
> >>@@ -0,0 +1,12 @@
> >>+require ti-sysbios.inc
> >>+
> >>+PV = "6_41_04_54"
> >>+PR = "r0"
> >>+
> >>+LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=95c3c6050fb23f2755ab75bf76805190"
> >>+
> >>+SRC_URI[sysbiosbin.md5sum] = "cbc53f2b15c2f70e2eaa05c1ed90b8db"
> >>+SRC_URI[sysbiosbin.sha256sum] = "2b4fcb85af4c0abc46dadc925312b2a28906ec34db9b1500f0c484ee3fcb58cf"
> >>+
> >>+TI_BIN_UNPK_CMDS=""
> >>+TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> >>-- 
> >>1.9.1
> >>
> >>-- 
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> 


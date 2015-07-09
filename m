Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF5CCE00A51; Thu,  9 Jul 2015 16:21:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EE9DE00A45
	for <meta-ti@yoctoproject.org>; Thu,  9 Jul 2015 16:21:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t69NLQpF013854
	for <meta-ti@yoctoproject.org>; Thu, 9 Jul 2015 18:21:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t69NLQD6009624
	for <meta-ti@yoctoproject.org>; Thu, 9 Jul 2015 18:21:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Jul 2015 18:21:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t69NLQ48022036;
	Thu, 9 Jul 2015 18:21:26 -0500
Date: Thu, 9 Jul 2015 19:21:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150709232111.GJ15657@edge>
References: <1436272155-9491-1-git-send-email-j-stiffler@ti.com>
	<20150707205920.GH11382@edge> <559D00CD.5010606@ti.com>
MIME-Version: 1.0
In-Reply-To: <559D00CD.5010606@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] ti-sysbios: Add version 6.41.04.54.
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
X-List-Received-Date: Thu, 09 Jul 2015 23:21:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

I think that was one of the long standing confusion - back in OpenEmbedded 
Classic days removing old version wasn't safe, as it could break someone 
else's build. So, people were advised to add new version they wanted, but send 
a separate patch that deleted the old one. If there was someone who used that 
specific old version, they could object to the second patch. That's why there 
used to be multiple versions of the same recipes all over the place. Now, with 
OpenEmbedded Core and the Yocto Project, the normal policy is to keep a single 
version of each recipe, where possible. Hence, updating recipe version is 
better done in a single patch, as it allows tracking recipe changes across 
versions with git log --follow flag. Other than that, I don't remember any 
other reason why would you want to do a version update in 2 separate patches. 
My position was always less strict - if you want 2 patches, then at least send 
them in right order, plus using -C --find-copies-harder flags would help with 
review, as it wouldn't look like 100% new file...

-- 
Denys


On Wed, Jul 08, 2015 at 06:51:57AM -0400, Jacob Stiffler wrote:
> I had once received a comment that it should be done this way:
> http://patchwork.dal.design.ti.com/patch/12482/
> 
> Let me know if I should resubmit this and the cgt6x patches.
> 
> On 7/7/2015 4:59 PM, Denys Dmytriyenko wrote:
> >Same comment/question about version update - any specific reason for 2
> >separate patches?
> >
> >
> >On Tue, Jul 07, 2015 at 08:29:14AM -0400, Jacob Stiffler wrote:
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  recipes-ti/bios/ti-sysbios_6.41.04.54.bb |   12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>  create mode 100644 recipes-ti/bios/ti-sysbios_6.41.04.54.bb
> >>
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
> >>1.7.9.5
> >>
> >>-- 
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> 


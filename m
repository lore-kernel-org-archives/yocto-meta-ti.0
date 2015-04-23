Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D949E009BB; Thu, 23 Apr 2015 04:42:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B923E00994
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 04:42:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3NBgHxL013661
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 06:42:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NBgGxx020432
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 06:42:16 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 06:42:15 -0500
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3NBgFsk012904;	Thu, 23 Apr 2015 06:42:15 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 23 Apr 2015 07:42:09 -0400
Message-ID: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC 0/2] Proposal for enabling CMEM
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
X-List-Received-Date: Thu, 23 Apr 2015 11:42:20 -0000
Content-Type: text/plain

This is a proposal for adding a CMEM region in the device tree.

I wanted to get comments on the following:

* implementation of using an inc file to enable this.
* Whether the actual configuration belongs in the kernel recipe, or if
  this is something that should be handled at the distro or branding
  level. (RFC sets the configuration in kernel recipe).
    - I have verified that this configuration may also be set in the
       branding file using, for example,

         CMEM_BASE_pn-linux-ti-staging_omap-a15 = "a0000000"
         CMEM_SIZE_pn-linux-ti-staging_omap-a15 = "20000000"

Jacob Stiffler (2):
  linux/cmem.inc: Support reserving memory for CMEM.
  linux-ti-staging_3.14: Add CMEM region for omap-a15.

 recipes-kernel/linux/cmem.inc                 |   22 ++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_3.14.bb |    6 +++++-
 recipes-kernel/linux/linux/cmem.dtsi          |   24 ++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/cmem.inc
 create mode 100644 recipes-kernel/linux/linux/cmem.dtsi

-- 
1.7.9.5



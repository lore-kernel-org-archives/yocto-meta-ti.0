Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41F9BE01430
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 01:08:09 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8E888n9004482
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 03:08:08 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8E888Tm008737
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 03:08:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 14 Sep 2012 03:08:07 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8E887Eo027272	for
	<meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 03:08:08 -0500
Date: Fri, 14 Sep 2012 04:08:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20120914080805.GD26968@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Make meta-ti comply with Yocto Project BSP requirements
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
X-List-Received-Date: Fri, 14 Sep 2012 08:08:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

One of the requirements for a BSP layer to be officially Yocto Project 
compliant or compatible is to avoid mixing hardware suport with policy 
configuration. Here is the corresponding commit from Richard to split 
meta-yocto into distro and BSP pieces, as separate layers:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/commit/?id=eac90e27a032ea23d9a4f35c7eef8b1940c80e22

In meta-ti we have several levels of severity in violation of this requirement:

1. Depending (i.e. DEPENDS/RDEPENDS) on packages from another "application" 
layer, such as meta-oe, meta-systemd, etc. It can be argued that such 
dependency is not on "policy configuration", plus it does not break parsing, 
unless problematic recipes need to be built, thus mark it as lower priority 
for now.

2. Depending (again, DEPENDS/RDEPENDS) on packages from a "distribution"
layer, such as meta-angstrom (or potentially, meta-yocto or meta-arago). This
does not break parsing, but violates the above requirement, by depending on a 
specific "policy configuration" layer. Medium priority.

3. Inheriting (i.e. inherit systemd) classes from another layer, such as 
meta-systemd. This behavior breaks parsing and requires BBMASK-ing those 
problematic recipes. Although, it requires an "application" layer and not a 
"distribution" one, it's quite bad nonetheless, as it breaks parsing. High 
priority.

4. Including (i.e. require/include) a file from a "distro" layer - again, 
depending on a specific "policy configurtion" layer is in violation of the 
requirement. And using "require" will even break parsing, when such layer is 
not referenced in the BBLAYERS stack. There are also problems with "include" 
as well, when variables like LICENSE are expected to be set by distro layer. 
High priority.


I'd like to start addressing these issues in the reverse order, according to 
the priority. There is a RFC with 2 possible quick/temporary workarounds to 
"fix" #4. Please provide feedback for those.

The longer-term proper solution would be to split out offending recipes into a 
separate layer. Nobody wants to simply remove them - we want to preserve them, 
just put them in right place.

I can create a sub-layer inside meta-ti and move the recipes there - can send 
a patch/proposal right away. Or we can agree to host them in an outside layer -
once they are copied there, I can remove them from meta-ti. Let's agree on 
something.

Yes, the topic of moving those recipes into a separate layer was discussed 
here ad nauseam lately, but this email is meant to lay down the official 
reasons for such move and follow through. Thank you for your cooperation.

-- 
Denys


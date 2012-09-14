Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64BD4E01430
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 23:43:24 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8E6h8X3006040
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 01:43:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8E6h8E1017983
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 01:43:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 14 Sep 2012 01:43:07 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8E6h7mO029415	for
	<meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 01:43:07 -0500
Date: Fri, 14 Sep 2012 02:43:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20120914064306.GC26968@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: RFC: 2 possible workarounds for recipes-misc dependency on Angstrom
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
X-List-Received-Date: Fri, 14 Sep 2012 06:43:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Koen et al,

There will be 2 patches sent under this thread that try to resolve the 
dependency of recipes-misc/images on meta-angstrom layer w/o (re)moving those 
recipes. Those are just 2 possible alternatives of fixing it up for now. The 
third option would be to move the recipes-misc/images to another layer, once 
we agree on its name/location and other details. Nobody wants to just remove 
those recipes w/o giving them a proper home. Which also means, that one of the 
proposed 2 workarounds can still be used temporarily until such home is found. 
[Or, one of the two can be the final solution, if we decide not to move...]

Please at least consider these patches and don't blindly dismiss them, as this 
matter is quite a hot button.

-- 
Denys


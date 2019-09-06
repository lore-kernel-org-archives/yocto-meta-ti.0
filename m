Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 750B0E00E39; Thu,  5 Sep 2019 22:54:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D947BE00D83
	for <meta-ti@yoctoproject.org>; Thu,  5 Sep 2019 22:54:49 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x865snb7025915
	for <meta-ti@yoctoproject.org>; Fri, 6 Sep 2019 00:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567749289;
	bh=42395P7oFo9opVwJPdoFbsU9xmEJ9nBYe+ezW//+CS8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NAOjb3/hzxC3pLJ+9DHXZF2yhZJ3nh32RBln9QNpWkspADrVitMLnyuJDyc0FBHET
	l21RBbWVCWhugZ9ddI21s4itZkCQ1ddpPpe+pIuhz8+lXm4e06bF6AjC08CVGlYkO+
	Cr5J2OkmRvel/j4BEoVwhpsgySuz95NVe33oKVBc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x865snoW121603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 6 Sep 2019 00:54:49 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 00:54:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 6 Sep 2019 00:54:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x865smHV038480;
	Fri, 6 Sep 2019 00:54:48 -0500
Date: Fri, 6 Sep 2019 01:54:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>
Message-ID: <20190906055448.GA2400@beryl>
References: <20190905163847.18928-1-afd@ti.com>
	<20190905163847.18928-4-afd@ti.com>
	<3636ba12ce614b7aaa514b36abd1de30@ti.com>
MIME-Version: 1.0
In-Reply-To: <3636ba12ce614b7aaa514b36abd1de30@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [thud/master][PATCH 4/5] ti-sgx-ddk-um: Drop omap5-sgx-ddk-um-linux package
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
X-List-Received-Date: Fri, 06 Sep 2019 05:54:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Anand,

Nothing uses omap5-sgx-ddk-um-linux and hasn't been for few years now.

Those recipes you mention used ti-sgx-ddk-um dependency directly for some 
time, but were update earlier to depend on virtual egl and/or libgles 
providers.

Also, please mind the public mailing list. Thanks.

-- 
Denys


On Fri, Sep 06, 2019 at 01:03:40AM -0400, Balagopalakrishnan, Anand wrote:
>    Andrew,
> 
>    I remember some of the other recipes (eg kmscube, omapdrmtest) in meta-ti
>    / meta-arago that depended on omap5-sgx-ddk-um-linux.
> 
>    We cleaned up some of those dependencies while adding J7. Not sure if all
>    of them have been covered. Have you confirmed?
> 
>    Regards,
> 
>    Anand
> 
>      ----------------------------------------------------------------------
> 
>    From: Davis, Andrew
>    Sent: Thursday, September 5, 2019 10:08:46 PM
>    To: Dmytriyenko, Denys; Tammana, Gowtham; Balagopalakrishnan, Anand; Ruei,
>    Eric
>    Cc: meta-ti@yoctoproject.org; Davis, Andrew
>    Subject: [meta-ti][thud/master][PATCH 4/5] ti-sgx-ddk-um: Drop
>    omap5-sgx-ddk-um-linux package
>     
>    No one in-tree depends on this anymore. This used to be the name of the
>    package so this was kept here for several years for backwards
>    compatibility. Remove this from PROVIDES.
> 
>    Signed-off-by: Andrew F. Davis <afd@ti.com>
>    ---
>     .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 20 +++++++++----------
>     1 file changed, 10 insertions(+), 10 deletions(-)
> 
>    diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>    b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>    index 0695ca0a..53d2829e 100644
>    --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>    +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>    @@ -23,22 +23,22 @@ INITSCRIPT_PARAMS = "defaults 8"
>     
>     inherit update-rc.d
>     
>    -PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm
>    omap5-sgx-ddk-um-linux"
>    +PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2
>    virtual/libgbm"
>     
>     DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
>     RDEPENDS_${PN} += "libdrm libdrm-omap udev wayland wayland-protocols
>    libffi expat"
>     
>    -RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm
>    omap5-sgx-ddk-um-linux"
>    -RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev
>    omap5-sgx-ddk-um-linux-dev"
>    -RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg
>    omap5-sgx-ddk-um-linux-dbg"
>    +RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
>    +RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
>    +RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>     
>    -RREPLACES_${PN} = "libegl libgles1 libgles2 libgbm
>    omap5-sgx-ddk-um-linux"
>    -RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev
>    omap5-sgx-ddk-um-linux-dev"
>    -RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg
>    omap5-sgx-ddk-um-linux-dbg"
>    +RREPLACES_${PN} = "libegl libgles1 libgles2 libgbm"
>    +RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
>    +RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>     
>    -RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm
>    omap5-sgx-ddk-um-linux"
>    -RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev
>    omap5-sgx-ddk-um-linux-dev"
>    -RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg
>    omap5-sgx-ddk-um-linux-dbg"
>    +RCONFLICTS_${PN} = "libegl libgles1 libgles2 libgbm"
>    +RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev libgbm-dev"
>    +RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg libgbm-dbg"
>     
>     # The actual SONAME is libGLESv2.so.2, so need to explicitly specify
>    RPROVIDES for .so.1 here
>     RPROVIDES_${PN} += "libGLESv2.so.1"
>    --
>    2.17.1


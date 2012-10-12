Return-Path: <h-fache@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85A03E0032E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 08:27:49 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CFRm1A027358
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 10:27:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CFRmdG021592
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 10:27:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 12 Oct 2012 10:27:48 -0500
Received: from [137.167.109.3] (unb0919861.emea.dhcp.ti.com [137.167.109.3])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CFRl0B004431	for
	<meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 10:27:48 -0500
Message-ID: <507836EF.8050506@ti.com>
Date: Fri, 12 Oct 2012 17:27:43 +0200
From: =?ISO-8859-1?Q?Herv=E9_Fache?= <h-fache@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
Subject: No /sbin/init when deriving m7y own image
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
X-List-Received-Date: Fri, 12 Oct 2012 15:27:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

Hi guys,

I am new to Poky and have created the following recipe:
    require recipes-graphics/images/core-image-x11.bb
    IMAGE_INSTALL += "omapdrmtest"

I have stored it at
meta-ti/recipes-graphics/images/core-image-x11-drmtest.bb for now, and
am building using:
    bitbake -k core-image-x11-drmtest

If I comment out the IMAGE_INSTALL line then everything is fine, but if
I leave it in then I am missing files in the filesystem, including
/sbin/init.

Can some one please let me know what I am doing wrong?

Thanks in advance,
Hervé


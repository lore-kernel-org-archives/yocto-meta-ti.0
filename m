Return-Path: <h-fache@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55E63E0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 01:26:02 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9B8PvEk005326;
	Thu, 11 Oct 2012 03:25:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9B8PvML010143;
	Thu, 11 Oct 2012 03:25:57 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Oct 2012 03:25:57 -0500
Received: from [137.167.109.3] (unb0919861.emea.dhcp.ti.com [137.167.109.3])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9B8PuYj006280;
	Thu, 11 Oct 2012 03:25:56 -0500
Message-ID: <50768291.8030106@ti.com>
Date: Thu, 11 Oct 2012 10:25:53 +0200
From: =?ISO-8859-1?Q?Herv=E9_Fache?= <h-fache@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>, Enrico Butera <ebutera@users.berlios.de>
Subject: Personal meta-ti tree for info
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
X-List-Received-Date: Thu, 11 Oct 2012 08:26:02 -0000
Content-Type: multipart/alternative;
	boundary="------------030606070100050500030602"

--------------030606070100050500030602
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

Hi Enrico, list,

I have posted my tree FYI here:
https://github.com/rvfh/meta-ti/commits/master

There are seven patches in there, some similar to Enrico's patches.
There are also the following patches which may or may not be of interest:
* xorg-driver: add xf86-video-omap recipes, already explained by Nicolas
in a different thread
* pandaboad: add xf86-video-omap by default in XSERVER config, goes with
the above
* Xorg: new config, goes with the above
* xserver-xorg: update to 1.12.4, this was to get the rotation working,
but it is also possible to get the patches for 1.11.x
* domx: add recipe for 2.2, this is useless here as the corresponding
firmware is not available - and it's not tested yet!

Regards,
Hervé

--------------030606070100050500030602
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Enrico, list,<br>
    <br>
    I have posted my tree FYI here:
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a href="https://github.com/rvfh/meta-ti/commits/master">https://github.com/rvfh/meta-ti/commits/master</a><br>
    <br>
    There are seven patches in there, some similar to Enrico's patches.
    There are also the following patches which may or may not be of
    interest:<br>
    * xorg-driver: add xf86-video-omap recipes, already explained by
    Nicolas in a different thread<br>
    * pandaboad: add xf86-video-omap by default in XSERVER config, goes
    with the above<br>
    * Xorg: new config, goes with the above<br>
    * xserver-xorg: update to 1.12.4, this was to get the rotation
    working, but it is also possible to get the patches for 1.11.x<br>
    * domx: add recipe for 2.2, this is useless here as the
    corresponding firmware is not available - and it's not tested yet!<br>
    <br>
    Regards,<br>
    Herv&eacute;<br>
  </body>
</html>

--------------030606070100050500030602--

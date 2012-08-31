Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71D82E0140A
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 06:37:13 -0700 (PDT)
Received: by wgx1 with SMTP id 1so1741668wgx.11
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 06:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6J7EgMx3fmobEZXG+rEXj9wp4H4qaqL3a4sPJRlI3YU=;
	b=U5r4mCw+4PHZCN01bUoTGGmRdwOb1BUHeCAZ9hKa7hHEkytUs84lI5xQdXHmoPs0a3
	0KnR4PHateGyHR8Vq6p2/5I1lWpZPS4YZZzn5ipGwXNmODfla6M8auH2Xc+lrpJTQ4kd
	+DVS+CIUtBBcugc3z/uRIRUxdzCnBOfsRxLPfP6Eyjxel7g5/PsHS3U+a78zrbvi1mWG
	g0epNSvgf7yQsmOeFIJ8vlylRWXA66bJwp0f55eJvGsuvlwlzH7/Sf8QF9AWX4vmyhHS
	A3XtJfBst9E3xMNwnt/cZPZhqMAxOH2Qrc/0Uf0EU/DTl478IfssPuFbiFfKI+/rZHGV
	EVnQ==
Received: by 10.180.8.41 with SMTP id o9mr4807727wia.3.1346420231928;
	Fri, 31 Aug 2012 06:37:11 -0700 (PDT)
Received: from [172.20.0.10] ([77.162.165.174])
	by mx.google.com with ESMTPS id cu1sm988942wib.6.2012.08.31.06.37.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 06:37:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5040BD5A.8090801@r-finger.com>
Date: Fri, 31 Aug 2012 15:37:06 +0200
Message-Id: <495E02FB-24CB-452E-8029-34DDA9DC99AB@dominion.thruhere.net>
References: <5040BD5A.8090801@r-finger.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQk7UwfAXVsNOkPwFvqVZgpWmLJ5gkylsIi5ZrtbeCV19p3L6BB5J56N0S0wCu5Zo4wz+QK3
Cc: meta-ti@yoctoproject.org
Subject: Re: CMEM module fails to load
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
X-List-Received-Date: Fri, 31 Aug 2012 13:37:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 31 aug. 2012, om 15:34 heeft Tomas Frydrych =
<tf+lists.yocto@r-finger.com> het volgende geschreven:

>=20
> Hi,
>=20
> I am trying to get the gstreamer-ti package to work, using the=20
> v2012.05-yocto1.2 tag of meta-ti and the current Denzil release;=20
> I am getting an error when the CMEMK module is getting loaded:
>=20
> Loading kernel modules for gstreamer-ti...=20
> Running /usr/share/ti/gst/omap3530/loadmodules.sh
> [  183.459136] CMEMK module: built on Aug 31 2012 at 12:17:02
> [  183.464965]   Reference Linux version 3.0.28
> [  183.469451]   File ... =
/linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
> [  183.487823] CMEM Range Overlaps Kernel Physical - allowing overlap
> [  183.494293] CMEM phys_start (0x86300000) overlaps kernel =
(0x80000000 -> 0x9b800000)
> [  183.502380] CMEMK Error: Failed to request_mem_region(0x86300000, =
16777216)
> FATAL: Error inserting cmemk =
(/lib/modules/3.0.28/kernel/drivers/dsp/cmemk.ko): Bad address
>=20
> I have also tried the linux-mainline kernel, to be precise commit
> b478431b3cb62dae735c26fa2dfd025ffbf0776c, but am getting the same
> error.=20
>=20
> Is this a known issue?

Only if you forgot to reserve a memory hole at boot.=20=


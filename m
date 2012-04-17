Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3D80E0044D
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:21:37 -0700 (PDT)
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 031344B0099
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 14:21:30 +0200 (CEST)
Date: Tue, 17 Apr 2012 14:21:29 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: meta-ti@yoctoproject.org
Message-ID: <20120417142129.42cd2a67@eb-e6520>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Pandaboard & meta-ti
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 12:21:39 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I've tried to build a xfce-nm-image for a Pandaboard (ES in the present
case) and it boots fine with the generated MLO, u-boot & uImage but I
don't manage to get a video output on both HDMI connectors : is there
something special to do here ?
(Same thing with systemd-image : I don't get any framebuffer output)

Also, it seems that the sdcard_image failed to build : is there a
specific setting to get the sdcard_image for Pandaboard which would
avoid to have to manually create the SDCard's partitions ?

Last question : why does conf/machine/include/omap4.inc require
conf/machine/include/tune-cortexa8.inc instead of tune-cortexa9 ?

Thanks
Eric


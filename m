Return-Path: <pabigot@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83353E00502
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:24:42 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by yenq10 with SMTP id q10so3631004yen.35
	for <meta-ti@yoctoproject.org>; Sun, 13 Nov 2011 10:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=2flbzF8cUE6BlQjpMv+ovHLIDxCb7A5zTHDj6HgzzIc=;
	b=t4KbLzzrJmIz41YKfSX+znyP59fk01yh/y5oprjOaKgy8AMnS7BgjyhDs+uiJDW11V
	4xGvIjF3Mt8CBjeRozmAIVZQy0YA9JevQ/utuY62aTYGEil/9e5XV97dy5iuiQnHMOM1
	klnAX/TwtABVBm8Ve3PSjcrJ8AVXqruEYb5uk=
Received: by 10.236.200.130 with SMTP id z2mr9512932yhn.25.1321208681293;
	Sun, 13 Nov 2011 10:24:41 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id 22sm53664880anp.12.2011.11.13.10.24.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Nov 2011 10:24:40 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Sun, 13 Nov 2011 12:24:15 -0600
Message-Id: <1321208655-9701-1-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/2] Alternative and extended improvements to sdclass_image
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
X-List-Received-Date: Sun, 13 Nov 2011 18:24:43 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

I understand the objections to my previous patch were that it would break
when SPL was used and there is no MLO, and that the approach isn't the one
that will eventually be implemented.  Since the current head version also
aborts if no MLO is present by that name (hence, doesn't work for
beagleboard), until the "right" solution can be obtained perhaps the version
herein can be installed.  It uses a more general method that should work now
and whenever x-load does (or doesn't) get fixed.

I also got tired of having to go down in to the basement to edit /etc/fstab
on the console every time I rebooted the development server and it hung
because it couldn't mount an unconfigured loop device.  Two enhancements for
that: allow an override to the mount point so I don't have to clutter up
/etc/fstab with hard-coded paths to workspace directories for every image I
might want to build, and add the noauto option.

Finally, I moved the IMAGE_FSTYPES append out of the class into the recipe
that actually depends on it, and got rid of the tar.bz2 which has nothing to
do with sdcard_image and is already present in all the machine confs anyway.

Peter A. Bigot (2):
  sdcard_image bbclass: fix MLO copy, loop device mounts, fstypes
  ti-hw-bringup-image: add sdimg to fstypes

 classes/sdcard_image.bbclass               |   47 ++++++++++++++++------------
 recipes-misc/images/ti-hw-bringup-image.bb |    2 +
 2 files changed, 29 insertions(+), 20 deletions(-)

-- 
1.7.6.4



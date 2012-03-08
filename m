Return-Path: <tom.rini@gmail.com>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A186E0030B
	for <meta-ti@yoctoproject.org>; Thu,  8 Mar 2012 11:34:08 -0800 (PST)
Received: by iagw33 with SMTP id w33so1426952iag.35
	for <meta-ti@yoctoproject.org>; Thu, 08 Mar 2012 11:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=vhe4g+mt1Xzt0X2M5b3cMnGjtkh+Em03k3jEnYBjKmc=;
	b=BTibaQgISyF7e5KQMJLaV9HWDK95JdsxwA2RTrIo52KjD4ihf8PnvDInhVYBNawx30
	ad45pZ51bKcTeXvbimGv1QabLv1vcWpDjs09Z91DtC6PuSSinmxJGa/jhLiTbqeGpjnZ
	NC/+bSfyrexbumEE7+vFuSqvBZMwuMMIzSvSSPTnHX1VwKp6BYTSXGMgnMyrCKOh2akh
	Ntr2h9PtiEQghndK0UCD0nY2An315AK9oLs6OW6oNtH5pkGWDBACuLqeR5vJ1JHU+UdY
	mdEtSu2iLYRpCzPcYZcHkOtT52zqQesEes7WaY4hdR6AQmX09mPcOxclfLB8ahV83oS8
	sOGg==
Received: by 10.50.154.132 with SMTP id vo4mr8453774igb.27.1331235247788;
	Thu, 08 Mar 2012 11:34:07 -0800 (PST)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id mi10sm2419490igc.8.2012.03.08.11.34.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Mar 2012 11:34:06 -0800 (PST)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu,  8 Mar 2012 12:34:00 -0700
Message-Id: <1331235244-5173-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/4] IMAGE_FSTYPES fixes / improvements
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
X-List-Received-Date: Thu, 08 Mar 2012 19:34:08 -0000

Hey all,

This short series does two things.  For 3 machines we fix a bug of using
'?=' rather than '+=' for setting IMAGE_FSTYPES (these are all of the
machines that have this issue today except for...) and on the 4th,
am335x-evm we add UBI support as well.  On the first three, these are
correct by inspection and on the fourth, I've written to and mounted
systemd-image from NAND on my EVM (it didn't work as I was using a custom
uImage that's not systemd-sane, and fixing that and confirming the config
used here works is on my list).

-- 
Tom



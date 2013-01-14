Return-Path: <pabigot@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 277C1E00740
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 11:41:23 -0800 (PST)
Received: by mail-ie0-f178.google.com with SMTP id c12so5802132ieb.9
	for <meta-ti@yoctoproject.org>; Mon, 14 Jan 2013 11:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=DS8ySWRPzqXLF+U0DLx1NzVqPmp1B1oqiTwzzxPcvOc=;
	b=Sv1chEJehtP26aZ2wuHOowFpkT0M/CUUPcD2UcaRp5glEmhCMV+arwLKuxXUAbnkR7
	fLSfxtyjFvFjciBWDkEKQRztPxJUUJ14qbvxEwlrpZFMzd3OrGGYePjFHUa0Vza7Fup7
	XAu7covxCclYyxBKY7k09h8f+0n2JIRayyq9duteATmDGEp3O6KzHUumcxQCui0ZclLQ
	gOnenaUr3evpyNd9PdEEOb5NZlZ1G6P9XspNhWSPm4NBp6ete/N3GG9UzrBSfbtwH+DP
	wMq7x3wX8VblXsY1SlzJqRm/ekh+Qk4cP7AxihblgVE7GUDkvUMV3b3u3vx89OKd9cRM
	SHRA==
X-Received: by 10.50.7.204 with SMTP id l12mr7952559iga.103.1358192482705;
	Mon, 14 Jan 2013 11:41:22 -0800 (PST)
Received: from llc.pab (c-66-41-60-82.hsd1.mn.comcast.net. [66.41.60.82])
	by mx.google.com with ESMTPS id rd10sm98877igb.1.2013.01.14.11.41.20
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 14 Jan 2013 11:41:21 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <pab@pabigot.com>
To: meta-ti@yoctoproject.org
Date: Mon, 14 Jan 2013 13:40:59 -0600
Message-Id: <1358192461-23771-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/2,danny] fix or ignore various QA errors
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
X-List-Received-Date: Mon, 14 Jan 2013 19:41:23 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

When building gstreamer-ti and its related tools for gumstix overo using the
danny branch, I get two classes of warnings:

WARNING: ti-dspbios: No generic license file exists for: TI in any provider

and

WARNING: QA Issue: ti-dspbios: Files/directories were installed but not shipped

The latter occurs multiple times for /usr/share/ti/ti-whatever-tree.

The first seems worth TI's attention from a legal perspective.  The second
is bothersome since it spews noise all over the screen obscuring more useful
information.

In addition there are several QA errors that require patches; I've attached
ones that work for me, but the libgles-omap3 one probably ought to fix the
errors instead of ignoring them.  Until somebody does that these will at
least let them build.

Peter A. Bigot (2):
  gstreamer-ti: fix package QA issue
  libgles-omap3: ignore QA errors

 recipes-graphics/libgles/libgles-omap3.inc |   30 ++++++++++++++++++++++++++++
 recipes-ti/gstreamer-ti/gstreamer-ti.inc   |    1 +
 2 files changed, 31 insertions(+), 0 deletions(-)

-- 
1.7.7.6



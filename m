Return-Path: <geiseri@geiseri.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 960FBE01565
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 16:40:00 -0700 (PDT)
Received: by mail-qc0-f176.google.com with SMTP id u12so3053031qcx.7
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 16:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=CNqvxmubZkS4J1hse6ls8VsGBbOmays+VeaMuN4dJFo=;
	b=VpMKTVwTW5qevcVBFjgSFGwOsRnhoG1HK4rBgKtpsHEoR8DtMfBc5rLfGmQixrGAR6
	0sUnFVpD5CUZOP7j0+fcUIrUiEpN/sUjI1l+cbVsZunsupBWOYy/GkcSNxRdN/YdSD2V
	qCz99W8H+wmCocwm/VH2H+Bc0q6ezveEYnHXQ8tpoPFQzeiViEedWN9jGqySIZ6x05vN
	3ARyYEbqFHfaVyZTiVrgFTCGoorbDr3So4LgVrFfcN+8xgjWRDjNeopEG4wNw52BCWIA
	XpM1gwL0XOUaQFeM/IMoeba+5MrJ1MMC6dkZvZtHEMh+k4CDa2kBHASvZARD6iWi4Rbs
	VVog==
X-Gm-Message-State: ALoCoQmVjXWEFpjHv0WO0lKEexPJ8Y+nFPQZtwLhGU9LTHfFUagg59GLTIMgz3ZwU8VAjN9j5vxy
X-Received: by 10.49.128.1 with SMTP id nk1mr11604178qeb.36.1376264399856;
	Sun, 11 Aug 2013 16:39:59 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-245-43-60.phlapa.fios.verizon.net. [96.245.43.60])
	by mx.google.com with ESMTPSA id q15sm34309900qak.5.2013.08.11.16.39.58
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 11 Aug 2013 16:39:59 -0700 (PDT)
Sender: Ian Geiser <geiseri@geiseri.com>
From: igeiser@devonit.com
To: meta-ti@yoctoproject.org
Date: Sun, 11 Aug 2013 19:41:35 -0400
Message-Id: <1376264495-7627-2-git-send-email-igeiser@devonit.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376264495-7627-1-git-send-email-igeiser@devonit.com>
References: <1376264495-7627-1-git-send-email-igeiser@devonit.com>
Subject: [PATCH 2/2] Fix filespath for dylan
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
X-List-Received-Date: Sun, 11 Aug 2013 23:40:00 -0000

From: Ian Reinhart Geiser <igeiser@devonit.com>

The old way of setting THISDIR in a bbappend clobbers THISDIR for
other layers.  This change makes it use the new way that is done
in dylan.

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
---
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
index 1615df3..491d403 100644
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
@@ -1,5 +1,2 @@
-PRINC = "2"
-
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
-
+PRINC := "${@int(PRINC) + 1}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.9.5



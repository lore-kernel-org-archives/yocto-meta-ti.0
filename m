Return-Path: <geiseri@geiseri.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4339CE013D1
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 16:39:47 -0700 (PDT)
Received: by mail-qa0-f44.google.com with SMTP id hu16so724732qab.17
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 16:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=BMnVdvFpFaP9MWNHIC3SL9NmPEoyslzU7B84wakwANw=;
	b=XydvrA/D8VkcO9ORUrEGL1Nqs4I6bU/xJINaC1/Y1mcXW0rG+udcqpZgwP55wYbWVY
	d5bV89c62T+ZWg35ZwFWhr5c6P5wLh6JgO2NqZxz8tI24I3hr9AU8td/gdIHNN9MuIp0
	1oj4Em6MHSIfJWpiLhihgIw79IUcnPygM+qyLmWRpZTL4lNdjVUiaEoMMzM2CrqlvBAv
	Tc94k5AYNcEZMTfEh5b7Ddc4wt59RW0TGgjMMAuSzZ67aahX0ZWs52QjNyBIir0b514O
	kuGgYfeSO1ppUXblW4Cx9+sy2XslnHwUvGbjUMVzZeNR8QE2Xvi5zCMN/zNoR3PjnIp1
	yMcw==
X-Gm-Message-State: ALoCoQmRMXAY/UocFZ9jwH+HoVn3Askc09qQSJzsNo6hp1o3Pe7HREzvoccjipGwDlz7De4Dfjq/
X-Received: by 10.224.120.202 with SMTP id e10mr22284931qar.23.1376264387034; 
	Sun, 11 Aug 2013 16:39:47 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-245-43-60.phlapa.fios.verizon.net. [96.245.43.60])
	by mx.google.com with ESMTPSA id q15sm34309900qak.5.2013.08.11.16.39.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 11 Aug 2013 16:39:46 -0700 (PDT)
Sender: Ian Geiser <geiseri@geiseri.com>
From: igeiser@devonit.com
To: meta-ti@yoctoproject.org
Date: Sun, 11 Aug 2013 19:41:34 -0400
Message-Id: <1376264495-7627-1-git-send-email-igeiser@devonit.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] Fix filespath for dylan
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
X-List-Received-Date: Sun, 11 Aug 2013 23:39:48 -0000

From: Ian Reinhart Geiser <igeiser@devonit.com>

The old way of setting THISDIR in a bbappend clobbers THISDIR for
other layers.  This change makes it use the new way that is done
in dylan.

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
---
 recipes-bsp/formfactor/formfactor_0.0.bbappend |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
index 4b8d0e6..491d403 100644
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -1,3 +1,2 @@
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
-
+PRINC := "${@int(PRINC) + 1}"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.9.5



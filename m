Return-Path: <aymeric.dumaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E890E007A0; Tue, 12 Aug 2014 18:00:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aymeric.dumaz[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.49 listed in list.dnswl.org]
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2EA5E00796
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 18:00:41 -0700 (PDT)
Received: by mail-wg0-f49.google.com with SMTP id k14so10768614wgh.32
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 18:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=84gcP9FPoDpIJntlf6BemuaK6T61Wu5ICdnD3tzBq4o=;
	b=n9Vw1igdbPfUrtPI1q+F7zbXVYrYuajOoNX3TTGjKnNmUWS4dCxSbuMfeId/6s2+AQ
	8AQSJfgnOpEeS0xxBKSYtphiOvpR77pfQPDgNToZaFVCa6Gs2jCihrNkmHd2/hF1oahW
	NAJ5gaoJ9ytdkW5kXE8QnNTGJoqL7EoK6MtNdPaybIIrdXLANXsiQ1S6J5LqwsdCjNCD
	7rGc+KZZ+BPnmWW0yWyqtLWUktT4z6AUcHVmbefl2P8flkAlXJGh+de8yGVWDo7fodIm
	9c3g4YBf6YmNsrgpRBoapLmS24exk6KZ0Qd1ekSaMA57IU6dYoP3WrRox5KZg+kbBJYL
	6J0w==
X-Received: by 10.194.206.67 with SMTP id lm3mr1161604wjc.70.1407891640588;
	Tue, 12 Aug 2014 18:00:40 -0700 (PDT)
Received: from localhost.localdomain (136.217.123.78.rev.sfr.net.
	[78.123.217.136])
	by mx.google.com with ESMTPSA id pe6sm752390wjb.38.2014.08.12.18.00.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Aug 2014 18:00:39 -0700 (PDT)
Sender: Aymeric Dumaz <aymericdumaz@gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 13 Aug 2014 03:00:25 +0200
Message-Id: <1407891625-23383-1-git-send-email-aymeric.dumaz@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [daisy/master][PATCH] recipes-qt: add a .bbappend for qtbase
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
X-List-Received-Date: Wed, 13 Aug 2014 01:00:50 -0000

This bbappend is inspired from the meta-fsl-arm one [1].
It is made to build qtbase with ligles-omap3 libraries and integrate more
plugins, like tslib.

It has only been tested on AM335x EVM-SK, hence the _ti33x overrides; the
QMAKE_LIBS flags come from [2] and [3].

[1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/qt5-layer/recipes-qt/qt5/
[2] https://github.com/prabindh/sgxconfiguro/tree/master/pkgconfig/5.xx
[3] https://github.com/prabindh/qt-configs/tree/master/qt5_1_1_Sep13

Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
---
 recipes-qt/qt5/qtbase_%.bbappend | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase_%.bbappend

diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bbappend
new file mode 100644
index 0000000..eaa4a6b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase_%.bbappend
@@ -0,0 +1,15 @@
+PACKAGECONFIG_GL_ti33x = "gles2"
+PACKAGECONFIG_append_ti33x = " tslib icu examples"
+
+do_configure_prepend_ti33x() {
+    sed -i 's!load(qt_config)!!' ${S}/mkspecs/linux-oe-g++/qmake.conf
+
+    cat >> ${S}/mkspecs/linux-oe-g++/qmake.conf <<EOF
+
+QMAKE_LIBS_EGL         += -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
+QMAKE_LIBS_OPENGL_ES2  += -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
+
+load(qt_config)
+
+EOF
+}
-- 
1.9.1



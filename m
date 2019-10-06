Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7A2AE008D9; Sun,  6 Oct 2019 16:13:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.196 listed in list.dnswl.org]
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAFD3E00805
	for <meta-ti@yoctoproject.org>; Sun,  6 Oct 2019 16:13:56 -0700 (PDT)
Received: by mail-pf1-f196.google.com with SMTP id y72so7408759pfb.12
	for <meta-ti@yoctoproject.org>; Sun, 06 Oct 2019 16:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Nz3jKs7Nxbxe9pQaZwes1RL5/e1JWzhR2JRSQxQYMEw=;
	b=gFUfNBosYr8/9nH3+0WsVwgBUAq8yRLSyNqxXFHUp4CMZlE6Fw7pd7jv/gLZiUplmA
	+Cg2ajAypiZGSIj1zpLHnhp+PSGL8jO5FJc5ZWvYbdcZypj02dk65X/W5xL1FoLxXLhb
	BRFMojcXzavHl+1uTkj9RGKiXNuHMSLmwzr4Qa4oAlNMbYibslF/79dZgnV0Vja+WVf2
	jUhvaEgqg1cPlG72UXFiiVPRwm9X1ev54VEh2pPH9pQviAwLme4FpSgWaix1O4S86JkN
	U38fOh49mjdQ17xRkwopaLjLo5+L2X+EaZDFzdzwvL8N03nz968vA/aH0zzXtMeWxWMQ
	SCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Nz3jKs7Nxbxe9pQaZwes1RL5/e1JWzhR2JRSQxQYMEw=;
	b=Z1vxqwNmSCSKqT4XvjXx0kI1UlGgGwWp7kumnWF/0vw+OaDhW9HgkXhEIYnBBFk9Af
	IARNNvyZWkfnsGdIu0BJj4pbNvdyDQyxx+yiaklYLz0KPR3ghJLLOCRKqkBVBPn8X18/
	4L7EQDNgzsIbocJzAq5b8KQyQIIo23zYU87wvr5RlUq2jt+im68ECbVcRK1E3kxljVjc
	IOUwFa15ehzxanN4v6pPreIqmxsr+SZy17X2ydLaltFyiqtu6nmzklgPTTrra3Gzea1f
	ahXOWJTIFdo+1wjnGya/3gSvXTda0AA4a3KR7n99hYXK6wFUNafman6syJLH7x5ThyN0
	eM6Q==
X-Gm-Message-State: APjAAAWhESgJdoX5WbE+zEcVJiO7nDys6BkBypBmLy1Oq1/I6owiGyWj
	64KBAsictJdHmGv807XBpH0ca6xIP1I=
X-Google-Smtp-Source: APXvYqwc8M6UuTWzWVAj6rUOKs78+fXRbqz0dhOxZejSM9Vpn/mbTPXiPCEMQFhkSopEdZoF1SlrLQ==
X-Received: by 2002:aa7:81d3:: with SMTP id c19mr29803796pfn.85.1570403635659; 
	Sun, 06 Oct 2019 16:13:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	p189sm11016460pga.2.2019.10.06.16.13.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 06 Oct 2019 16:13:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sun,  6 Oct 2019 16:13:42 -0700
Message-Id: <20191006231342.745776-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] ion-tests: Fix build with musl
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
X-List-Received-Date: Sun, 06 Oct 2019 23:13:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-PAGE_SIZE-with-local-variable-name.patch | 69 +++++++++++++++++++
 recipes-devtools/ion/ion-tests_git.bb         |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch

diff --git a/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch b/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch
new file mode 100644
index 00000000..8915c642
--- /dev/null
+++ b/recipes-devtools/ion/ion-tests/0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch
@@ -0,0 +1,69 @@
+From f045cbf9aae0053e9e785e32b772e473aa892443 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Oct 2019 16:08:36 -0700
+Subject: [PATCH] map_test: Replace PAGE_SIZE with local variable name
+
+PAGE_SIZE is already a define in libc implementations global namespace
+e.g. in musl. Therefore its best to use a unique variable name to not
+stamp on the global definition.
+
+Fixes
+src/map_test.cpp:59:23: error: expected unqualified-id
+unsigned long PAGE_SIZE = sysconf(_SC_PAGESIZE);
+^
+/usr/include/limits.h:89:19: note: expanded from macro 'PAGE_SIZE'
+^
+/usr/include/bits/limits.h:3:18: note: expanded from macro 'PAGESIZE'
+^
+
+Upstream-Status: Submitted [https://github.com/glneo/ion-tests/pull/1]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/map_test.cpp | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/map_test.cpp b/src/map_test.cpp
+index a7ce2c9..7b5746d 100644
+--- a/src/map_test.cpp
++++ b/src/map_test.cpp
+@@ -56,27 +56,27 @@ TEST_F(Map, MapOffset)
+         SCOPED_TRACE(::testing::Message() << "heap " << heapMask);
+         int map_fd = -1;
+ 
+-        unsigned long PAGE_SIZE = sysconf(_SC_PAGESIZE);
++        unsigned long psize = sysconf(_SC_PAGESIZE);
+ 
+-        ASSERT_EQ(0, ion_alloc(m_ionFd, PAGE_SIZE * 2, heapMask, 0, &map_fd));
++        ASSERT_EQ(0, ion_alloc(m_ionFd, psize * 2, heapMask, 0, &map_fd));
+         ASSERT_GE(map_fd, 0);
+ 
+         unsigned char *ptr;
+-        ptr = (unsigned char *)mmap(NULL, PAGE_SIZE * 2, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, 0);
++        ptr = (unsigned char *)mmap(NULL, psize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, 0);
+         ASSERT_TRUE(ptr != NULL);
+ 
+-        memset(ptr, 0, PAGE_SIZE);
+-        memset(ptr + PAGE_SIZE, 0xaa, PAGE_SIZE);
++        memset(ptr, 0, psize);
++        memset(ptr + psize, 0xaa, psize);
+ 
+-        ASSERT_EQ(0, munmap(ptr, PAGE_SIZE * 2));
++        ASSERT_EQ(0, munmap(ptr, psize * 2));
+ 
+-        ptr = (unsigned char *)mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, PAGE_SIZE);
++        ptr = (unsigned char *)mmap(NULL, psize, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, psize);
+         ASSERT_TRUE(ptr != NULL);
+ 
+         ASSERT_EQ(ptr[0], 0xaa);
+-        ASSERT_EQ(ptr[PAGE_SIZE - 1], 0xaa);
++        ASSERT_EQ(ptr[psize - 1], 0xaa);
+ 
+-        ASSERT_EQ(0, munmap(ptr, PAGE_SIZE));
++        ASSERT_EQ(0, munmap(ptr, psize));
+ 
+         ASSERT_EQ(0, close(map_fd));
+     }
+-- 
+2.23.0
+
diff --git a/recipes-devtools/ion/ion-tests_git.bb b/recipes-devtools/ion/ion-tests_git.bb
index 831f5e8c..52346f1c 100644
--- a/recipes-devtools/ion/ion-tests_git.bb
+++ b/recipes-devtools/ion/ion-tests_git.bb
@@ -8,6 +8,7 @@ PV = "1.0"
 BRANCH = "master"
 SRC_URI = "git://github.com/glneo/ion-tests.git;protocol=git;branch=${BRANCH} \
 	file://0001-CMakeLists.txt-disable-phys-addr-for-now.patch \
+	file://0001-map_test-Replace-PAGE_SIZE-with-local-variable-name.patch \
 "
 SRCREV = "70d730cebca29e6fd37b21d9beac82ae645f3900"
 
-- 
2.23.0



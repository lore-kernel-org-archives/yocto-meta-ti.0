Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.3919.1577145631742474804
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Dec 2019 16:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sq2wfRu7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id c23so7780682plz.4
        for <meta-ti@lists.yoctoproject.org>; Mon, 23 Dec 2019 16:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQDFNFUrape9JmOrRU0EK0jRKaiC9M/WFPlKpEw9MLc=;
        b=Sq2wfRu7dm4WenjjJVQScXBwBJe2ge0xcfv03oKSARGTAxpzeER2eHXb2h9x3J6YCu
         jqXP/Sg6QLXpnv5eNsTmtnYw887ln+va7rDnSJCMflCmYugERGkxqYoansvQVwprqpLb
         1b5WGaDOjv0qpHEVkNV8wjjK3HjUQ4JJlAFMFaAY8y+R66FPb6R5BHuPyTET5/Cs1/Uo
         Hsc3Eqnsb3u0MA82TszF0qo7J8QQo83YPPd6zHEgPTP1TJ4fK5K0UIWLYtRVq1+mzoLF
         HEwhlHMf6N82KuHpYxi27IZ+sZX1FY9RwLjrkmSEOZzwgeW1bxR/Z8qr3Ru0QqNRQExn
         lFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hQDFNFUrape9JmOrRU0EK0jRKaiC9M/WFPlKpEw9MLc=;
        b=goTklcyY/PnFg0YzUw5/6JNZDRhEIPEp/LawhN3AYj+j1XOzJbYE8jKJp6nvKSQnsF
         pOo7Z5vSuhqpF8cumpRXWziR5YCLsvIoYyyZ0b9BWIi6rp31MwgsvKk/gQ5qZmLZSm5M
         F6imbiv03J9oVUPjVnvPKQo+E54U64WxjzWYw0KBoMHZCINdt2FN7YL0Vx7dt3mz53mA
         Te2a9xK5Unvc4bsqqigabswjqjuRAFQ8WsjqSttNALogO5KA6NLl8ypamr7BFMsstw0X
         K/c924glXQA/Ng/B6chBubupak8Fu9qM9ohIyrcNurMi4Z7dSeBxkSx2VwLVkFLz81om
         jNhA==
X-Gm-Message-State: APjAAAV6at80PxlSpAxnKRw8GkEUmJA+O+FCvzj8R0xLnSPWSox0+A1M
	+bperGi31IW5CQGZRCjALpbrzW8e1oI=
X-Google-Smtp-Source: APXvYqwW5aBkotwzLnOuw/LLNlPdi/eHZ3RgnQc9MkIbXpbjXFbW8QQnO7D1ZGzW3aYmZR0ZlEAZMQ==
X-Received: by 2002:a17:902:7e49:: with SMTP id a9mr31280338pln.230.1577145630651;
        Mon, 23 Dec 2019 16:00:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
        by smtp.gmail.com with ESMTPSA id b19sm11288473pfo.56.2019.12.23.16.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 16:00:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rwmem: Include <stdexcept> where it is missing
Date: Mon, 23 Dec 2019 16:00:18 -0800
Message-Id: <20191224000018.2308154-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
rwmem/opts.cpp:87:15: error: 'invalid_argument' is not a member of 'std'
throw std::invalid_argument(string("Unrecognized option ") + argv[optind - 1]);
           ^~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-for-invalid_argument-and-out_of_ra.patch | 35 +++++++++++++++++++
 recipes-bsp/rwmem/rwmem_1.2.bb                |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 recipes-bsp/rwmem/rwmem/0001-include-stdexcept-for-invalid_argument-and-out_of_ra.patch

diff --git a/recipes-bsp/rwmem/rwmem/0001-include-stdexcept-for-invalid_argument-and-out_of_ra.patch b/recipes-bsp/rwmem/rwmem/0001-include-stdexcept-for-invalid_argument-and-out_of_ra.patch
new file mode 100644
index 00000000..41999492
--- /dev/null
+++ b/recipes-bsp/rwmem/rwmem/0001-include-stdexcept-for-invalid_argument-and-out_of_ra.patch
@@ -0,0 +1,35 @@
+From b5677a3461f4b44b78e74a6b46629606adad11c1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Dec 2019 15:52:15 -0800
+Subject: [PATCH] include <stdexcept> for invalid_argument and out_of_range
+
+Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/6]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ librwmem/regs.cpp | 1 +
+ rwmem/opts.cpp    | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/librwmem/regs.cpp b/librwmem/regs.cpp
+index 5e5c22f..669d10d 100644
+--- a/librwmem/regs.cpp
++++ b/librwmem/regs.cpp
+@@ -1,4 +1,5 @@
+ #include <memory>
++#include <stdexcept>
+ #include <cstdint>
+ #include <cstdlib>
+ #include <cstring>
+diff --git a/rwmem/opts.cpp b/rwmem/opts.cpp
+index 0a10567..e521d56 100644
+--- a/rwmem/opts.cpp
++++ b/rwmem/opts.cpp
+@@ -1,4 +1,5 @@
+ #include <algorithm>
++#include <stdexcept>
+ 
+ #include <unistd.h>
+ #include <getopt.h>
+-- 
+2.24.1
+
diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
index 0545b0cc..9177e60d 100644
--- a/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -15,6 +15,7 @@ SRCREV_FORMAT = "rwmem_inih_pybind11"
 SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
            git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
            git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
+           file://0001-include-stdexcept-for-invalid_argument-and-out_of_ra.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.24.1


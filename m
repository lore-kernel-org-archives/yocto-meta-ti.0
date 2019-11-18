Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0685DE00875; Mon, 18 Nov 2019 10:45:32 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.214.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1F80E007AE
	for <meta-ti@yoctoproject.org>; Mon, 18 Nov 2019 10:45:30 -0800 (PST)
Received: by mail-pl1-f195.google.com with SMTP id d7so10271274pls.3
	for <meta-ti@yoctoproject.org>; Mon, 18 Nov 2019 10:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RRtQvbjmXXeAn4W3/jJxknDYoFB+Qnlkd76wMEOVoow=;
	b=cVXU5HuENedb3Z5DsIolFJo4wzp6GIqwmkEn619vF4cd14uPDoNJRotPFVJ5OhJj+u
	wWHtaaaY9JxE0wSXkFn15e3LqmVV5M1piQctZl9wFk2qZ6k2hKHTeo2dJsoOglU7rG1E
	gHXA5r23y3Ie4oUVYuNnUvNNqIg09rNE50z+SPFUwQOdYzJzhzit9t6V8fj9lmB3cyMZ
	9E8BsZnwxp0Mt1Ylk28M+IgHFZ/UMKXmIwFR38AQ+PdKObJPagfAF25++vvsWF5TlqDB
	T98LL4Ag4pY8S/VfWo63JnI8yNAh0h9KBV2xBAklKOBe9mT2R4R3PlM4ZoDMf5W5veE2
	FRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RRtQvbjmXXeAn4W3/jJxknDYoFB+Qnlkd76wMEOVoow=;
	b=KC/OtDAszOoHnobnP1FJOvduCwOeJIppLuz4A8dHc1QvWIy0fQhBJsH0L67Co76im2
	fkUxiJAYf+6RzBbRCmNvuW+LxS38hdWYg+77fVfl9b+G69BqKBCNnfBw2cHz7XvxK9tr
	PkWvLZgRw4XUlNT3jKmXI9hN9FSbtFdjvhNYM3DBml4w1wLlD8WX1kx01OcyLfX2RMon
	JvbI1pbWxNQB9avmvpkJa7vY1PkKn7H530W/LeBPUf05Z1OpdZh6+/KJEFioyuyN3X/+
	WMbndyuvrLZf7AVhX3CF9qoJdVSWbeRC3KZsBoLW/ivkKYd9ZXNJiID74UJ0dGhXB3R+
	JFUA==
X-Gm-Message-State: APjAAAVjTL2OqeLu/kI9E8B9ckROqCNffng61cQFmRv8XtL8DSDmT7ac
	ZkDrPRe5gxikThhpKjt8V3zeeZEc+pU=
X-Google-Smtp-Source: APXvYqwn2v+D6LhDMbcudkv0hhK/E+sWlZE2l+c2RsHTss8Kj7+f+Mn/c7VedHq1T3bNnzV+vo8wvQ==
X-Received: by 2002:a17:902:76ca:: with SMTP id
	j10mr12044213plt.58.1574102729695; 
	Mon, 18 Nov 2019 10:45:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	w15sm16743720pfi.168.2019.11.18.10.45.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 10:45:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Nov 2019 10:45:13 -0800
Message-Id: <20191118184513.560611-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] kselftests: Disable for riscv
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
X-List-Received-Date: Mon, 18 Nov 2019 18:45:32 -0000
Content-Transfer-Encoding: 8bit

4.10 did not have RISC-V support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-kernel/kselftests/kselftests_4.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
index 96263875..115b0767 100644
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -185,3 +185,6 @@ INSANE_SKIP_${PN}-exec = "ldflags"
 INSANE_SKIP_${PN}-ipc = "ldflags"
 INSANE_SKIP_${PN}-mount = "ldflags"
 INSANE_SKIP_${PN}-vm = "ldflags"
+
+COMAPTIBLE_MACHINE_riscv64 = "(null)"
+COMAPTIBLE_MACHINE_riscv32 = "(null)"
-- 
2.24.0



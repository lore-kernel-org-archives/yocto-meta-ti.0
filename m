Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFA39E007AD; Sat, 18 Mar 2017 01:39:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.52 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 268E0E00349
	for <meta-ti@yoctoproject.org>; Sat, 18 Mar 2017 01:39:45 -0700 (PDT)
Received: by mail-lf0-f52.google.com with SMTP id z15so40746254lfd.1
	for <meta-ti@yoctoproject.org>; Sat, 18 Mar 2017 01:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ydcArfN+zySh2YQnsY4MWo/2ovS2ZKeUNcZzjjePIXQ=;
	b=iwwh4o2l6n4cqkfFtBHuDALPMFCWkC0i8a4Ha/Moge1l8YFiNzsI3l4Hvl9J4Ljntu
	CmcgGJmvYjhlAo9iMdU32YAR/EbHvVEo1SxZdcg+AihN+HDVNxk4d6X+zJXeMLP+CNOl
	fJP6XC64n1p1cybFbwvqqDTdWteMZy8eBlzQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ydcArfN+zySh2YQnsY4MWo/2ovS2ZKeUNcZzjjePIXQ=;
	b=Bj9n/NgqgnEERqW+u6D/c6pGbWsPtcPUnHQAGO3ecU6SdcTx7s0b5D1NfjzteGJwKY
	VYvZSsCsBtU5kiWqhnmXeoRrFEXP0biF0VhxyuUEvnt7KUZCl0XV8LAvRyDqyCsIt9xz
	XOqH4dGLHElqO4CGCPZXaVU3MPHKm/I6st29AFcGWX/15++J15b2HFzjmY8ExpkPzVZr
	N2fqdW35bwf26q5Bi4wERLbVf0B8T8cqu33jl1RRbmWJ227RR3TpQqd4kfCxwWQxzlk8
	YzvfUKUnH44FzLUxQFbMA7quWt4uLF0RJ4lxC5xKOYd++q5PfqotP+uSg5/wlc3a93rp
	QWdQ==
X-Gm-Message-State: AFeK/H1D5HsEFe1Nn7nm9/0ZtcnK2gnOUiU8FcS81TuhGRijpXv4hq9kGeDpeXw5d8toLZ5/
X-Received: by 10.46.14.25 with SMTP id 25mr6208246ljo.55.1489826384497;
	Sat, 18 Mar 2017 01:39:44 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id v2sm1891712lja.31.2017.03.18.01.39.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Mar 2017 01:39:43 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Sat, 18 Mar 2017 10:39:40 +0200
Message-Id: <20170318083941.21353-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [morty-next][PATCH] kselftests: add bash/ncurses runtime dependency for futex test
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
X-List-Received-Date: Sat, 18 Mar 2017 08:39:48 -0000

futex test requires tput at runtime.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index 3cd12ea6..6e8c2143 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -142,6 +142,7 @@ FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
 
 RDEPENDS_${PN}-cpu-hotplug += "bash"
 RDEPENDS_${PN}-efivarfs += "bash"
+RDEPENDS_${PN}-futex += "bash ncurses"
 RDEPENDS_${PN}-memory-hotplug += "bash"
 RDEPENDS_${PN}-net += "bash"
 RDEPENDS_${PN}-vm += "bash"
-- 
2.11.0



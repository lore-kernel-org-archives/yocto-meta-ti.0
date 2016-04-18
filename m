Return-Path: <daniel.ammann@bytesatwork.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74E61E00D42; Mon, 18 Apr 2016 02:23:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25BF4E0077F
	for <meta-ti@yoctoproject.org>; Mon, 18 Apr 2016 02:23:51 -0700 (PDT)
Received: from [192.168.2.42] (unknown [95.143.48.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: daniel)
	by bytesatwork.ch (Postfix) with ESMTPSA id 3CF9118000F8
	for <meta-ti@yoctoproject.org>; Mon, 18 Apr 2016 11:23:44 +0200 (CEST)
To: meta-ti@yoctoproject.org
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Message-ID: <5714A737.4030504@bytesatwork.ch>
Date: Mon, 18 Apr 2016 11:21:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
Subject: omap3-sgx-modules for ti kernel 4.1/4.4?
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
X-List-Received-Date: Mon, 18 Apr 2016 09:23:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi

Is there going to be a new version of the accelerated sgx sdk
(omap3-sgx-modules_5.01.01.02.bb) that works with ti 4.1 or 4.4 kernel 
on am335x?

I think ti 4.1/4.4 kernel will be released for yocto 2.1/krogoth?

As far as I can tell the current recipe only works with 3.14 kernel.

Thanks and kind regards

Daniel



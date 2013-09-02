Return-Path: <tasskjapp@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E650AE006E5
	for <meta-ti@yoctoproject.org>; Mon,  2 Sep 2013 05:06:42 -0700 (PDT)
Received: by mail-la0-f51.google.com with SMTP id es20so3450230lab.24
	for <meta-ti@yoctoproject.org>; Mon, 02 Sep 2013 05:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=XfCurUnOmFTJqU/ozzC1pRE0++EvDWuLW1syoU4YDis=;
	b=Gr67aDQcbXt3xd2t/YmtYiUydEixXZhm252N0fD0kYCquSLCvP266YcaxVzgZLCHqB
	dsMZCW0CygIVW1zNPDL/srNS1ry/i6/4gBBgorxh0yI53fBEi3yPqykLNvnGA/10Hv5e
	cC0Oy+Z6zpmQ/UomQ8fnL8hyaOMR8CpDtIYzZAAXZA4wOpobmDVr5XlIesW/1DvaTgGF
	gWe7/KSFHMmd6MNLevvqDYmvfE30h1DtULU7JTXaVWa+w/JFIyYQNnAEtiwfYtBaKe4N
	p+yGuNwmLpDjPdxD0ZZSBPGg8eLWSH2w5hpSxft2LTytlVoVlbJvLBcFThlLaqbARTeT
	WHiA==
X-Received: by 10.152.2.74 with SMTP id 10mr1487179las.36.1378123600712;
	Mon, 02 Sep 2013 05:06:40 -0700 (PDT)
Received: from [192.168.0.209] ([77.40.182.98])
	by mx.google.com with ESMTPSA id n15sm6215119laa.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 05:06:39 -0700 (PDT)
Message-ID: <52247F4E.6030404@gmail.com>
Date: Mon, 02 Sep 2013 14:06:38 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-5-git-send-email-denis@denix.org>
	<20130901031528.GA18322@edge>
In-Reply-To: <20130901031528.GA18322@edge>
Subject: Re: [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove old 4.03.00.02 version
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
X-List-Received-Date: Mon, 02 Sep 2013 12:06:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/01/2013 05:15 AM, Denys Dmytriyenko wrote:
> BTW, consider this an RFC for removing the next 4.05.00.03 version as well - I
> know some people are still using it, so please speak up.
>

We're using 4.05.00.03 for our OMAP3530 board, because that is the 
latest one we've tried that actually works :)

Last time I tried newer versions there were "instant lockup" problems. 
Are any of the newer versions compatible with OMAP3530 now?

- Tasslehoff


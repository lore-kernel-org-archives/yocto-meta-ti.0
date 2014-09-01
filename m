Return-Path: <fabio@bertux.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A89D4E0082D; Mon,  1 Sep 2014 04:58:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7B1FE00824
	for <meta-ti@yoctoproject.org>; Mon,  1 Sep 2014 04:58:28 -0700 (PDT)
Received: by mail-qa0-f53.google.com with SMTP id w8so4825365qac.26
	for <meta-ti@yoctoproject.org>; Mon, 01 Sep 2014 04:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=aL4OzNn5SXuvnY3liLla0u9OJnPn/MV9N7xoRM4KJ0A=;
	b=EU2ogfxK66A7RnONUuoNhJe0q7T90acBHiNwsS6jqrzqVwlkNN22nv3jfLU8tVk5+E
	mH6t4Pikadqgh8Ji1tWUEWKXdq3j++p2qRTkwpyf3uM68NGa8SKkfg2rk41tnNp9OJSt
	spBATnBJvTnIXw1t62+Y1dFag1N50+0kzplY3ElCFqZDD3FGsH7T1PbJ9VkBZXYur98H
	n2yIFvmwN7YdnhJ4B5NcshAzWT2b87FRa9hxlqu2XSyvKXKrWBhawNVTK/Sf1NsePTSw
	/wNuIS2zsnjqrbPhXRfbDL/EW8caLiW0y+VWmH+Kt8JLzvUeiQJvOkBKiF562KcPea+E
	q6MQ==
X-Gm-Message-State: ALoCoQnEgc96Alpw98HKV5IJbbGqXs7dXzB4DadUXc/69bw7vTVKj3dOAapWqXSbP1acRO83s5Vi
X-Received: by 10.140.41.101 with SMTP id y92mr41304157qgy.69.1409572707790;
	Mon, 01 Sep 2014 04:58:27 -0700 (PDT)
Received: from [192.168.0.103] ([177.156.157.41])
	by mx.google.com with ESMTPSA id h9sm1526069qaf.38.2014.09.01.04.58.26
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Sep 2014 04:58:27 -0700 (PDT)
Message-ID: <54045F61.5030906@bertux.com>
Date: Mon, 01 Sep 2014 08:58:25 -0300
From: Fabio Berton <fabio@bertux.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <mailman.22627.1409553652.26702.meta-ti@yoctoproject.org>
In-Reply-To: <mailman.22627.1409553652.26702.meta-ti@yoctoproject.org>
Subject: Re: BeagleBoard C4 with USB
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
X-List-Received-Date: Mon, 01 Sep 2014 11:58:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I had this issue too on my beaglebone black, the "lsusb" output was 
"unable to initialize libsub: -99". I changed the kernel config and 
other things but didn't work, and then I put the packages that I wrote 
and work. I don't why these packages were installed, because there's 
usbgadget usbhost distro_feature.

On 09/01/2014 03:40 AM, meta-ti-request@yoctoproject.org wrote:
> Re: BeagleBoard C4 with USB



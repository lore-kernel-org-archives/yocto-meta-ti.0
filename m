Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94F4BE00AE6; Wed,  5 Jul 2017 23:18:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.179 listed in list.dnswl.org]
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70CADE00ACF
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 23:18:07 -0700 (PDT)
Received: by mail-pf0-f179.google.com with SMTP id c73so6235542pfk.2
	for <meta-ti@yoctoproject.org>; Wed, 05 Jul 2017 23:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=9G4EEn3zCilXSKbPKSpgms+2te8xlQRGrfndvyKoETc=;
	b=nWuyA5OSbWe2WjbpATNG6DcQmYq/erK2FYZuHBMFwkkZ+PzQbPI6FbsMzfXOLww3w7
	2O2irR6UD+rShPL5JX2EBtxlaLy8Fj6aUoSi9v2wn+gX//S/RntCwjTvDkHYL79iof+O
	+Esaa3iYbxg1/BP+ndiUKuHhvFNTlAi2mWw4VzpdM6qMwofDq+yGCwBBSgUN5JO5E0JT
	HQ5cd39VK75dVarWMTtO9NSfxpSHOTLCWeKrqD3Cch01HcZzxEjASwP7YD0FokhKcvQY
	XoB6EOX3hNMG5U3wHo2ZNBZo6JyDon/S3g6oo3YVt3iFMwSZz5J6i8LOypP/dDSoet2K
	vDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=9G4EEn3zCilXSKbPKSpgms+2te8xlQRGrfndvyKoETc=;
	b=l8j54a1h8b8tNrAtwqxewgyIOkXPWvXcFdGtG+V7bwmuzQeDRcqOPA/YisPU8DCY36
	CQk5SUc7OylDAEYMhDPNhmfQ82UtLLeG4rUX5n/Mzaf9uRGLnHt2iGvsQCyROunYx42i
	pQ6dgx6fK/fdqHUUnMFavqQGH9vC92CwzKwtTbAtQsJPRtts1w8v8aYAhx5pg+xlr/vH
	H1flYthd6ldGYsbcybEOPWJfr96qnZO3rrahFt+cLTH7tFUzpq52WqseTfNJbz/c+CRj
	jqPfX0peSxeZ4g68GTqpDJzF9rI5a08mHlnmXYjaGxdMXGjinNaUF8WH9eHShJtoipBC
	D3tA==
X-Gm-Message-State: AIVw112wFEoIAVWfMOtjcMdzTIEvAoSvxYLarsEM1GQB71VgeFw8+vTB
	iRlktcYBdg8k0BSb
X-Received: by 10.99.51.1 with SMTP id z1mr25065111pgz.227.1499321886422;
	Wed, 05 Jul 2017 23:18:06 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:4cfe:6c48:891b:52e0?
	([2001:8003:804a:b500:4cfe:6c48:891b:52e0])
	by smtp.gmail.com with ESMTPSA id 66sm1533343pgh.59.2017.07.05.23.18.04
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jul 2017 23:18:05 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <bc6ae1fe-32e2-5afe-8d26-0e9b3676cc2b@gmail.com>
	<CAOCHtYhAihOvX3TRijFyc6ArMtBW23boDrEezVLOW6ECcCqaXg@mail.gmail.com>
	<CAByQQ_r5oVJio+Ze8xE2w8QhLGH0g8QupKaWMRh7FseVgaB7tg@mail.gmail.com>
	<CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <2f4770f5-e4d5-3485-9663-c7e7c9b7eab9@gmail.com>
Date: Thu, 6 Jul 2017 14:18:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com>
Subject: The bug is gone but SPI0 still 000000
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
X-List-Received-Date: Thu, 06 Jul 2017 06:18:11 -0000
Content-Type: multipart/alternative;
	boundary="------------B125E6FE9A2DC0C805BE897C"
Content-Language: en-US

--------------B125E6FE9A2DC0C805BE897C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Meta-TI Yocto Member,

The bug is gone but SPI0 still 000000

root@beaglebone:~# ./spidev_test_fromhost -D /dev/spidev1.0
spi mode: 0
bits per word: 8
max speed: 500000 Hz (500 KHz)

00 00 00 00 00 00
00 00 00 00 00 00
00 00 00 00 00 00
00 00 00 00 00 00
00 00 00 00 00 00
00 00 00 00 00 00
00 00
root@beaglebone:~#

What do I miss here ??

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------B125E6FE9A2DC0C805BE897C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Meta-TI Yocto Member,<br>
    </p>
    <p>The bug is gone but SPI0 still 000000</p>
    <p>root@beaglebone:~# ./spidev_test_fromhost -D /dev/spidev1.0 <br>
      spi mode: 0<br>
      bits per word: 8<br>
      max speed: 500000 Hz (500 KHz)<br>
      <br>
      00 00 00 00 00 00 <br>
      00 00 00 00 00 00 <br>
      00 00 00 00 00 00 <br>
      00 00 00 00 00 00 <br>
      00 00 00 00 00 00 <br>
      00 00 00 00 00 00 <br>
      00 00 <br>
      root@beaglebone:~# <br>
      <br>
    </p>
    What do I miss here ??<br>
    <br>
    <div class="moz-signature">-- <br>
      <b>
        <p style="color:blue;"> /*******/<br>
          Sent by Ubuntu LTS 16.04,<br>
          Kind regards,<br>
          Riko Ho<br>
          /*******/<br>
        </p>
      </b></div>
  </body>
</html>

--------------B125E6FE9A2DC0C805BE897C--

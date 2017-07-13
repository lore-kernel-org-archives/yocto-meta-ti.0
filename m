Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E2B9E009E7; Wed, 12 Jul 2017 20:19:05 -0700 (PDT)
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
	*      [74.125.83.53 listed in list.dnswl.org]
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 633F1E009A4
	for <meta-ti@yoctoproject.org>; Wed, 12 Jul 2017 20:19:01 -0700 (PDT)
Received: by mail-pg0-f53.google.com with SMTP id u62so22393311pgb.3
	for <meta-ti@yoctoproject.org>; Wed, 12 Jul 2017 20:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=6ulqjTX0X8PRQzZsV0I5udTWz3+fPrKR0KGStHyX8rg=;
	b=KwacXKc7sIQxOSAz1sqZlZHfk8sYze2xHHgdajVEXqbE3hLTzBRWb6FfWUvN1xTxTV
	+RlB8fh4ZLJqja7o+v+DEWQ2lOA8AdeMN6We9Qb/OdIRP2i1cKQKOaRIfJsMe9nohMsN
	fg6mIXWwPzGfYc3zis+vxnc4DMWKdQEW4uBMhpZdWbGlFXEfX5Ehj8XlcKsAMurSWrX+
	LPrGq9GBHR9OKtIi2egv1163QObrjQ645HQzfL5RZFD7MtfkquLAS5moRlkHWvZHvUQs
	r5TSgAGFZuuoD/Aotb9/XkE57PoJ3BDc476FvOrKArtpOPkLvaBb3EfT3IQpPyirYGBc
	pz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=6ulqjTX0X8PRQzZsV0I5udTWz3+fPrKR0KGStHyX8rg=;
	b=OpK4RZ68fqolO8vmMx1EucnLy3fGNevAl1ZMUgN8Puouu82VNRjEqAj9Y4LME19fEJ
	JjMyJ8gQF/+nSRXeH6IcjqOt9USp76EVdNUV7yg9MXj485cv6AalZT/tszVhbT/Oa/g0
	06CWvTezHQ1o/BABsKXMoIn0ibuO+AdlsG2456T9/jFlw99cUmXVRxAJycTRg7UY/gjZ
	t4xb4IZXI3aG+CponO3lPnmuFzoMeJjspzEOELspW1QaeThJSSXSOnIf4tpRTPRr2/ny
	ea8YSbWFX5YFfNo4PFx9jhFxNQ5YSkj+eOtBTbog8ftb58dQBVUVI44txpQiKfNennNy
	0csQ==
X-Gm-Message-State: AIVw110scGGA/0zVOIi7zC0l0mvKLiirQ/MGveA2AJqDvLcKWKwMxhfw
	u1PU04kTuHlIRJKG
X-Received: by 10.84.212.2 with SMTP id d2mr7788092pli.24.1499915941131;
	Wed, 12 Jul 2017 20:19:01 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:29fa:64e4:9fd4:25e5?
	([2001:8003:804a:b500:29fa:64e4:9fd4:25e5])
	by smtp.gmail.com with ESMTPSA id
	q81sm7997976pfj.85.2017.07.12.20.18.58 for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 20:19:00 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <4e5c09e7-30f0-bc0d-57f8-fe5a3f3b0b74@gmail.com>
Date: Thu, 13 Jul 2017 11:18:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
Subject: Writing a driver for beaglebone black ?
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
X-List-Received-Date: Thu, 13 Jul 2017 03:19:05 -0000
Content-Type: multipart/alternative;
	boundary="------------DF330D74B1AC087FD023BD23"
Content-Language: en-US

--------------DF330D74B1AC087FD023BD23
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Meta-TI Team Member,

How can I make a driver for beaglebone black ?

I saw an example for Atmel,

============

/arch/arm/mach-at91/board-
sam9260-ek.c:

struct 110xx_board_info {
int device_id;
int gpio_reset;
int gpio_dreq;
};
struct 110xx_board_info 110xx_device_0 = {
.device_id  = 0,             // = /dev/vs10xx­0
.gpio_reset = AT91_PIN_PB16, // = GPIO 80
.gpio_dreq  = AT91_PIN_PB17, // = GPIO 81

============

How can I implement those on beaglebone black ?

I have enabled GPIO from DTS (am335x-boneblack.dts), how can I connect 
it to kernel or it's the way connecting my GPIO to kernel ?

I want to make something like /dev/110xx_board and pass data to it, if 
possible ?

Thanks,

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------DF330D74B1AC087FD023BD23
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Meta-TI Team Member,</p>
    <p>How can I make a driver for beaglebone black ?</p>
    <p>I saw an example for Atmel,</p>
    <p>============<br>
    </p>
    <p>/arch/arm/mach-at91/board-<br>
      sam9260-ek.c:<br>
      <br>
      struct 110xx_board_info { <br>
      int device_id; <br>
      int gpio_reset; <br>
      int gpio_dreq; <br>
      }; <br>
      struct 110xx_board_info 110xx_device_0 = { <br>
      .device_id  = 0,             // = /dev/vs10xx­0 <br>
      .gpio_reset = AT91_PIN_PB16, // = GPIO 80 <br>
      .gpio_dreq  = AT91_PIN_PB17, // = GPIO 81</p>
    <p>============</p>
    <p>How can I implement those on beaglebone black ?</p>
    <p>I have enabled GPIO from DTS (am335x-boneblack.dts), how can I
      connect it to kernel or it's the way connecting my GPIO to kernel
      ?</p>
    <p>I want to make something like /dev/110xx_board and pass data to
      it, if possible ?<br>
    </p>
    <p>Thanks,<br>
    </p>
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

--------------DF330D74B1AC087FD023BD23--

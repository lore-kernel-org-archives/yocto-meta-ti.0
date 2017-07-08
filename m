Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14699E00BEF; Fri,  7 Jul 2017 22:57:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
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
	*      [74.125.83.54 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.54 listed in dnsbl.sorbs.net]
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0309E00BE0
	for <meta-ti@yoctoproject.org>; Fri,  7 Jul 2017 22:57:48 -0700 (PDT)
Received: by mail-pg0-f54.google.com with SMTP id t186so26494788pgb.1
	for <meta-ti@yoctoproject.org>; Fri, 07 Jul 2017 22:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=PCehHUY7vthvdxana9zfSck+dtuYgdUIBOshBJdppmk=;
	b=Zita5CWocCklypLrdSAyjAz3azjZnFdkMGNbqE4yQbQTSVmCaA7gRdufvUL0fBKkRy
	wPPrQ1OxvxmDblr5mg8GFdGBIIBEf+5wOM6ngTdQes7fqNfyLOLpd5dOx3TvfkxQCefk
	9zNUR83loMvQJq97LM13Vq/wJwYFelI3kJCgKBEuglwV4eHa/rCN8S4m9xCqEfYs3FYC
	4HJiITNMi9FvEY/tV11IYfjBtI1RQSTO0gxcIBipeItiws2DGtGuWV4wujTSXSSq26F+
	G3hfCerOLYAuTnPoSlzP23/pVYVxsMjg4DCJntm7H0DSAH0R3MZ9eYXyUJqE3oL8fUa6
	4NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=PCehHUY7vthvdxana9zfSck+dtuYgdUIBOshBJdppmk=;
	b=rEjKAavByI214jSsrrBo+G+YfP+8JpqDVpOi9tQAjZDZZ6UkF4oks1hW87+gLneG2p
	9EH91dEnkh2JUihidHUdU5WjjUpz9eqnM1LOLEx8iDUWr5Px9BkAHRO54jDxS/Uv7w+a
	GPeM7Vu7Wo2OV4nYqB5T329v3g9ElvJFoHIae+/wWHD5IhR5O4uh/t0EGm25vuTfc341
	N21qPK7Z31SJltBIToFiweRUAa+ab7TGFMWal6Ak1OWTDOiiloXtDq/51XRL5+nwdkXb
	iG3FRo7RaGWgC/FeBfPz8qgNLfC2JgQdpziJfM9zTDbRPSWQq26sRXq/H/tSP6NjlyAV
	EFFA==
X-Gm-Message-State: AIVw112toWPEzCxBtIdNaBnjKRKZo9svwmT7QoMLiNT4iqnMwF3BXdvA
	SEWfQg+JxX3vbE60
X-Received: by 10.98.101.4 with SMTP id z4mr11475305pfb.163.1499493467690;
	Fri, 07 Jul 2017 22:57:47 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:cd78:cc04:4b01:72bb?
	([2001:8003:804a:b500:cd78:cc04:4b01:72bb])
	by smtp.gmail.com with ESMTPSA id
	x64sm10400943pfk.20.2017.07.07.22.57.46
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jul 2017 22:57:47 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <a0cd3eaa-8a47-e4e1-5952-868a78a922cd@gmail.com>
Date: Sat, 8 Jul 2017 13:57:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
Subject: RTL8192 with beaglebone ?
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
X-List-Received-Date: Sat, 08 Jul 2017 05:57:54 -0000
Content-Type: multipart/alternative;
	boundary="------------1795D6629806B7E26909D208"
Content-Language: en-US

--------------1795D6629806B7E26909D208
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Meta-TI Team Member,

I tried to put RTL8192 USB Wifi Dongle, but it can not be stabilized, 
always down by itself,

How can I fix it ? with USB mouse and Keyboard it worked well, but after 
I put Wifi dongle it was down,

Thanks

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------1795D6629806B7E26909D208
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Meta-TI Team Member,</p>
    <p>I tried to put RTL8192 USB Wifi Dongle, but it can not be
      stabilized, always down by itself,</p>
    <p>How can I fix it ? with USB mouse and Keyboard it worked well,
      but after I put Wifi dongle it was down,</p>
    <p>Thanks<br>
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

--------------1795D6629806B7E26909D208--

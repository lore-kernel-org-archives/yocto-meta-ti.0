Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8EB34E00BEF; Sat,  8 Jul 2017 01:28:01 -0700 (PDT)
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
	*      [74.125.83.48 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.48 listed in dnsbl.sorbs.net]
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C108E00BE0
	for <meta-ti@yoctoproject.org>; Sat,  8 Jul 2017 01:27:58 -0700 (PDT)
Received: by mail-pg0-f48.google.com with SMTP id u62so27364604pgb.3
	for <meta-ti@yoctoproject.org>; Sat, 08 Jul 2017 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=J/M0s6dSGmoiw1u5JXhWfIKA5PkJTCWHBtYTGuw6XF8=;
	b=QZ22esz98KKAmt0C50QDu3hD2DrrYGZVL3PhG/5Pqwlvccxes3E/5YzzMlmLlCGQou
	acT67XPgX7FRsp6xN8hbpj+lSdo+Lev8ks+cntajXEQE2J+2CW/hCgyMKzPf+mSl9w4X
	/a4D3bZbmPnGgV9bp8MJ6L0HO7Ra8hI6PnEZgDIxxuFOM6N6npOSsf5bdGTzrE3wqMNq
	gRnK8TDfss0XJhuhz8dZaXud9wt56xuIrmeSYCY3LUwvGvgM4/isqtXpPGv4ZEpqWHZo
	CdBuFI9KHYjGA7SqDIhnk2Nom/k+wwg4BSy208Q2da7xyDNfsOob45Ov6iVlXhVGOPrY
	mivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=J/M0s6dSGmoiw1u5JXhWfIKA5PkJTCWHBtYTGuw6XF8=;
	b=kCiT5iSOtv8OjbP3k8gbUBiYe6NWWCD35U5Vx8z+Z8pbfGZ6X78yXXdMUrc7KTWo+d
	NOxZsKLOcYO2wmLnze7BzgeU0yUjYqrgndaJ1BnUGq2nv4mMVs0h4/cPQ/r0tz+XRIXt
	JjJMj+U+2kDGgHl+/oHY7vdgWgCOOIu4hvRPWLXGyzTTxP6WusNS/Gr5X/Q9BD+QPG96
	eOmyEFQ5rMUu0dlbqdVJCMaP8lsRRDz8FKnIS2mpTHn7P0V2EH3SU2ZEgKr1GyOMeHtH
	+tTgtvfRZ9+5K5TL9jR0rOEM2nr9A97kcbhGv1HKs6+MiaMfNh1simt061QDsNCXzzcL
	nBQw==
X-Gm-Message-State: AIVw112A3H4z+zlmbLEWqbyEg8Tt7Wrr6GT4GmyTLoKR6nX4lOI8A+uA
	raOK5l4wIiW7jp6J
X-Received: by 10.98.245.22 with SMTP id n22mr35009354pfh.96.1499502477762;
	Sat, 08 Jul 2017 01:27:57 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:cd78:cc04:4b01:72bb?
	([2001:8003:804a:b500:cd78:cc04:4b01:72bb])
	by smtp.gmail.com with ESMTPSA id
	g79sm11551268pfg.121.2017.07.08.01.27.56
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 01:27:57 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <05f45fe3-7bd6-0259-e211-351ea2a6121f@gmail.com>
Date: Sat, 8 Jul 2017 16:27:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
Subject: usb 1-1: device descriptor read/64, error -110
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
X-List-Received-Date: Sat, 08 Jul 2017 08:28:01 -0000
Content-Type: multipart/alternative;
	boundary="------------BCA8DA95DE1B30CABCB42D50"
Content-Language: en-US

--------------BCA8DA95DE1B30CABCB42D50
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Team Member,

How can I fix this bug ?

usb 1-1: device descriptor read/64, error -110

?

Thanks

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------BCA8DA95DE1B30CABCB42D50
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Team Member,</p>
    <p>How can I fix this bug ?</p>
    <p>usb 1-1: device descriptor read/64, error -110<br>
    </p>
    <p>?</p>
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

--------------BCA8DA95DE1B30CABCB42D50--

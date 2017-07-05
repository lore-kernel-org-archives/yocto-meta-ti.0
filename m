Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FAF8E00BE9; Tue,  4 Jul 2017 19:58:54 -0700 (PDT)
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
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.65 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.65 listed in list.dnswl.org]
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8873CE00BE0
	for <meta-ti@yoctoproject.org>; Tue,  4 Jul 2017 19:58:53 -0700 (PDT)
Received: by mail-pg0-f65.google.com with SMTP id j186so29374619pge.1
	for <meta-ti@yoctoproject.org>; Tue, 04 Jul 2017 19:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=9K/uaudmgNemkjWye125SppcizyKTNX/31GlOWDPU4A=;
	b=Fl+Bc/D6tZRzzW3i14w/BJIyUiSqN+41NGMYlSPr21iLxIc6HxQrDSQweFgLh9B2Ad
	V/q10VXFlVFeH/F+a5a1Lb6AwgXqr+i1Qi0ycjrpkw3asNkPxowFQgl8vyUyVyYO8y6+
	theApY5vyEC53rEaVu2TBdMusLUksqtKb1QcZvs/MAjL6Yj7zjzitIRP609stUqOT2mz
	R6h4yaHht79Z7VwA+k2ayeeGo22tQVOXSrL4gjITDmQ0zedtMg70GjFvUFF99UCF5VW+
	o//DP26UTVpw0X7hNVpvUUVy1m/VGRQHzQrGJeeEx44zahSvjumIB896SqvoFaCAO422
	lmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=9K/uaudmgNemkjWye125SppcizyKTNX/31GlOWDPU4A=;
	b=REEwzva99Hrq1UfBtFYa2o3Vsk+biPjKbqxoCsL2aSfpaVZGqIPWB6nXZP9Yd6EpNt
	KqwAgCKY1UU0/uxIKGzpLH1R+s7g7HbSYjysGAN5SRBo+GJCfi54HZ2zSrXJWnwYkSXT
	PYVmybU5lnI9r00Ll94xrCHrERNTzb3C1D9VfJSpruVoMd2+deBuZALgPi2DGtGtrmfp
	tCZAoPT0SnexLrluuezjmXvyXJ0m9cG1pNNMr9lXGe0gchzlt9dy7TdDKwhj39BT4Xmy
	RW7GMcq1wF9RRV2lNuLbsYpkRrj6D7YrCS594LKUd5WmEB6HTT8otSgKnHDRqJTSUa3h
	OY8A==
X-Gm-Message-State: AIVw112RwSAVXui+mZMqO3fGi9BZnoqNiWc7I8aGJmv0+vUK7sn0DQJY
	DYV+j9pPoFtReVv5
X-Received: by 10.98.196.155 with SMTP id h27mr18270918pfk.130.1499223532665; 
	Tue, 04 Jul 2017 19:58:52 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:8c94:2d3e:fbf5:a0d8?
	([2001:8003:804a:b500:8c94:2d3e:fbf5:a0d8])
	by smtp.gmail.com with ESMTPSA id
	n71sm45879980pfi.95.2017.07.04.19.58.51
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jul 2017 19:58:52 -0700 (PDT)
To: meta-ti@yoctoproject.org
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <bc6ae1fe-32e2-5afe-8d26-0e9b3676cc2b@gmail.com>
Date: Wed, 5 Jul 2017 10:58:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
Subject: boot/dtbs/4.4.54-ti-r93/am335x-boneblack.dtb
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
X-List-Received-Date: Wed, 05 Jul 2017 02:58:54 -0000
Content-Type: multipart/alternative;
	boundary="------------D2ED861C4DDDEF53DCDDC92C"
Content-Language: en-US

--------------D2ED861C4DDDEF53DCDDC92C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear meta-ti Team Member,

Is it possible that I use this dtb with beagle yocto kernel ? if it is, 
how to do that ?

loading */boot/dtbs/4.4.54-ti-r93/am335x-boneblack.dtb *
-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------D2ED861C4DDDEF53DCDDC92C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear meta-ti Team Member,<br>
    </p>
    <p>Is it possible that I use this dtb with beagle yocto kernel ? if
      it is, how to do that ?<br>
    </p>
    loading <b>/boot/dtbs/4.4.54-ti-r93/am335x-boneblack.dtb </b>
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

--------------D2ED861C4DDDEF53DCDDC92C--

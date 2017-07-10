Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8ADEEE00C29; Sun,  9 Jul 2017 21:31:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.41 listed in dnsbl.sorbs.net]
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
	*      [74.125.83.41 listed in list.dnswl.org]
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BAB6E00C1F
	for <meta-ti@yoctoproject.org>; Sun,  9 Jul 2017 21:31:30 -0700 (PDT)
Received: by mail-pg0-f41.google.com with SMTP id u62so42901295pgb.3
	for <meta-ti@yoctoproject.org>; Sun, 09 Jul 2017 21:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=yTY7eImbcmxgPuAmJ3rjURmxbZ+b4G1FZiGKxIG6Ocw=;
	b=RMeURlesunjPLB6Dc9PnoVlC0bfShzrG1vG7+T5FF6gAjXPDK5/nGk3n9womjzI9im
	ckFbrJ75eRVc7kP3iEJSgpGWkir2A17duR3OpuLWAPB7eHL82xA/GuaMff6sBO/RaC8n
	khY+Xi7oiknGLDU2biBy1ijOtoLqx4c/pHWKl1HdovvQx2JO6heO/jU61+PZ9azt7HM8
	vGwlg5/mvmEQWRRFIMesAbPOEggPEo7918yUdhUiUmBGqDwr9Ud79qs1BbIPRGutmSsR
	4fgetWfhEKjScE80uW0gmWzPkmaJ3mHVuwBXMpVsxfccYEcqGEY/Os+ySYz+uCe7vo6o
	2/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=yTY7eImbcmxgPuAmJ3rjURmxbZ+b4G1FZiGKxIG6Ocw=;
	b=diD/pv3lQWo58EDCK3Wy4q1w9LBnVG+NpLcLuWr9raMERtvdgNVQ+gPGoTyvvJyl1T
	WgaVWyRMfNwznB+FnaxP8ClFUBgQAY5bvasFE5kaPG5qcRyVgax/kwTKQu70vmYlHrs/
	Wx55/XcrKZx4UeE2eyDoJy/L1jw8cnUmi3gO9NQYtKK67Yh2oYYDfiLDgSVhhZf+gsN0
	FA4FjToUFwCJR48clQdeN+ZQAFERdj4WVtFhSMuXqJSG+p4Vnmdt406fp+GurTkHEB03
	8Xs1D/LfgC+USrvr6KnGOmaxKkwdJLAVn9+s0F37Ughw3GSQ9GtztxWNaojdD2aGxDbQ
	Ek4A==
X-Gm-Message-State: AIVw111vpxSd9cFttXJuEW1xXyGm/kQ0SVZp8dBU+PStQ6cBMJDYVX+D
	Wf3Kq9EbQzvwhXz0
X-Received: by 10.98.46.131 with SMTP id u125mr5245833pfu.238.1499661089335;
	Sun, 09 Jul 2017 21:31:29 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:9088:5782:e93e:b0c7?
	([2001:8003:804a:b500:9088:5782:e93e:b0c7])
	by smtp.gmail.com with ESMTPSA id
	e189sm19022092pfe.100.2017.07.09.21.31.27
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Jul 2017 21:31:28 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <061b44df-abb7-4c16-7891-888f4796e158@gmail.com>
Date: Mon, 10 Jul 2017 12:31:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
Subject: HDMI and Wifi USB dongle ?
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
X-List-Received-Date: Mon, 10 Jul 2017 04:31:33 -0000
Content-Type: multipart/alternative;
	boundary="------------C2EF18E225745586E1B6C50A"
Content-Language: en-US

--------------C2EF18E225745586E1B6C50A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Meta-TI Members,

How can I fix the current issue between HDMI port and Wifi on USB dongle ?

Everytime I put HDMI, my USB dongle is down ??

Thanks

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------C2EF18E225745586E1B6C50A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Meta-TI Members,</p>
    <p>How can I fix the current issue between HDMI port and Wifi on USB
      dongle ?</p>
    <p>Everytime I put HDMI, my USB dongle is down ??</p>
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

--------------C2EF18E225745586E1B6C50A--

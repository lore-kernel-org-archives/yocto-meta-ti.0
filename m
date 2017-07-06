Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7FE46E00AE6; Thu,  6 Jul 2017 00:22:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.170 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.170 listed in dnsbl.sorbs.net]
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E5DCE00ACF
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 00:22:56 -0700 (PDT)
Received: by mail-pf0-f170.google.com with SMTP id q85so7043886pfq.1
	for <meta-ti@yoctoproject.org>; Thu, 06 Jul 2017 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=KLqa2f5A5x+Jzx49CC4yO8n3bz0ILJ2L2gwrFN2Ihiw=;
	b=hOW6JjHp37GWl2EVmSlzn6FpoiLkdei2Bf7ncEC2NDNRgqfTDXvnAzES3NYXJQ6kCx
	48kveXzWSy+WFqn+5g9Hxg8K3CgqRduBfTK0UuC3OvrCQHFong/NmeJ3dw9NamIPxNsZ
	3/1GkWqt3ILoTb82B3bjJMiTveY1W/tDQYZouWl1KuUFHI5t/qp6eRzY/P2zY3GXizCW
	5sjdePdtUOkO/QKqLDNAh4HFEVqLyCIcPfeub1BNjhTEi6aE+6cX7deqBQIxRL72kgr6
	RlENXhtXshtkLwHQsgTqX1IqmDMLs8YiFl+J2lBQc/DQsL4KGnlO8aIlSjgWGNE2MpMy
	vAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=KLqa2f5A5x+Jzx49CC4yO8n3bz0ILJ2L2gwrFN2Ihiw=;
	b=dS2kj3OLnyNMG7kND1PMBYcQsz4q8enSEG/8dVR1MCEiqysKyaXVbsZdBeZTABJSrT
	czKwGyqb3Qd5CKNdw0nIT7CpRr/XqFE6gSTVWPa3p+jcSKnd5c+r0yOuTsPK2PiqaM+s
	uvFHKho1Psd9kfGG+Z3++MvS1xcpdV12S39yHAASz5dQKm+WzGUTgSyEc9P/vw2JPe2X
	TfyWzcYNbjhY/jgI+H/OcatsMYejth4o/VdCytn0bKMZNX4ztkKX0Ktdi11w1krgvLO9
	cxjN8CozW1R2aI3cpxPi2UDQNyotJXZhBkmbRk75ZIDOkwkIs9x6Y01Elm8kj7OaPqzF
	NEfg==
X-Gm-Message-State: AIVw112qRPHKtSq+hAjrtwRtN/2ZHrEMygwf8Gi26Z0RS7Eh1YqofdCR
	njfNLQr01awu4oUF
X-Received: by 10.98.200.208 with SMTP id i77mr21113467pfk.54.1499325776357;
	Thu, 06 Jul 2017 00:22:56 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:4cfe:6c48:891b:52e0?
	([2001:8003:804a:b500:4cfe:6c48:891b:52e0])
	by smtp.gmail.com with ESMTPSA id t4sm1878115pgs.22.2017.07.06.00.22.54
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 00:22:55 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <bc6ae1fe-32e2-5afe-8d26-0e9b3676cc2b@gmail.com>
	<CAOCHtYhAihOvX3TRijFyc6ArMtBW23boDrEezVLOW6ECcCqaXg@mail.gmail.com>
	<CAByQQ_r5oVJio+Ze8xE2w8QhLGH0g8QupKaWMRh7FseVgaB7tg@mail.gmail.com>
	<CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <bd07a68c-5415-a481-36a3-5edc4cf3af25@gmail.com>
Date: Thu, 6 Jul 2017 15:22:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com>
Subject: Different response if I change the mode of SPI, but not yet right ?
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
X-List-Received-Date: Thu, 06 Jul 2017 07:22:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Dear Team Member,
Different response if I change the mode of SPI, but not yet right ? What 
is the issue ?

root@beaglebone:~# ./spidev_test
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
root@beaglebone:~# ./spidev_test -C
spi mode: 4
bits per word: 8
max speed: 500000 Hz (500 KHz)

00 00 00 00 00 00
00 00 00 00 00 00
00 00 00 00 00 00
00 00 00 00 00 00
00 00 00 00 00 00
00 00 00 00 00 00
00 00
root@beaglebone:~# ./spidev_test -CO
spi mode: 6
bits per word: 8
max speed: 500000 Hz (500 KHz)

03 03 03 03 03 03
03 03 03 03 03 03
03 03 03 03 03 03
03 03 03 03 03 03
03 03 03 03 03 03
03 03 03 03 03 03
03 03
root@beaglebone:~# ./spidev_test -CH
spi mode: 5
bits per word: 8
max speed: 500000 Hz (500 KHz)

0F 0F 0F 0F 0F 0F
0F 0F 0F 0F 0F 0F
0F 0F 0F 0F 0F 0F
0F 0F 0F 0F 0F 0F
0F 0F 0F 0F 0F 0F
0F 0F 0F 0F 0F 0F
0F 0F
root@beaglebone:~#



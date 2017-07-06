Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFB0BE00B28; Thu,  6 Jul 2017 00:35:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.50 listed in dnsbl.sorbs.net]
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F732E00AE4
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 00:35:39 -0700 (PDT)
Received: by mail-pg0-f50.google.com with SMTP id u62so7155375pgb.3
	for <meta-ti@yoctoproject.org>; Thu, 06 Jul 2017 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Ysyb1i1SYc7bzKJjyxlkA9ceISVd6MBweS84DSQ9dPU=;
	b=QKS8rktDMg/tgTMtUeFMjC2iPIzW8CmifwJBPycgc5QvpZp6E/gMDcyEiTX5YZ0Xxy
	mnvlyEnCfirAgnNnKSY40ealAhCu76uzqCsNbBjrqpRMQw3PIB3haSTZSbQ28+Z8NNkh
	tYlMUdvhioBxz3HIai0LrMbyd1sTLkZqvDmKiy/sV+COs+VYgkZQwTevwL/dnhDoJlsx
	CT+va8bM0IkQDfhm4IGASNtvB8dYdvSGIubhHa5A+y+twnzLn9MdKgo3C0QyI1qO7MSn
	tizpZu9kaKqIan7AiSFo+j+uCACbuVQ720XPOMI6wiMnN33u/ocbxr3a8xWgTGY3KQHP
	Hirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Ysyb1i1SYc7bzKJjyxlkA9ceISVd6MBweS84DSQ9dPU=;
	b=lmjZAOGebACP4679mvgyd34Z4Ncj14o4VkQMhAOW2rqP2UQMicQKAtasjxWCtOAhYn
	t/75QwOwkGLDgUYZw4NAgvQ/9YLqfytAoqEikB9Fl8pIZPk1HRZzeFZUe2b9lFhVgx28
	qB47GHXsiU4WbgbmXK7L/I+XNlSN4OKlYO6OWfBDR0W4Jkl53U8LxFx/tvTPftSWcOp9
	k4XLdHvEzbHG6/Exd49BUkQ7QxTPGn1TaBpbyBx14zlvrfEBsS3z0ejoPSlQSDHDNoQy
	DwzVBx+Ly8MunMADWHq9dkVrMnwSB0FclymIdBtk6waU/PPCMorcxuKbj2iWW02e7NjA
	kxAA==
X-Gm-Message-State: AIVw1102JGUUhX+L9As+EXtchCl7jkNjwfDwe01cK8BCbhiNe3z5st4a
	7A/nt0dZtGQoF7t3
X-Received: by 10.84.160.226 with SMTP id v31mr26019655plg.91.1499326539249;
	Thu, 06 Jul 2017 00:35:39 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:4cfe:6c48:891b:52e0?
	([2001:8003:804a:b500:4cfe:6c48:891b:52e0])
	by smtp.gmail.com with ESMTPSA id
	w66sm3212844pfi.63.2017.07.06.00.35.37 for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 00:35:38 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <bc6ae1fe-32e2-5afe-8d26-0e9b3676cc2b@gmail.com>
	<CAOCHtYhAihOvX3TRijFyc6ArMtBW23boDrEezVLOW6ECcCqaXg@mail.gmail.com>
	<CAByQQ_r5oVJio+Ze8xE2w8QhLGH0g8QupKaWMRh7FseVgaB7tg@mail.gmail.com>
	<CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <c83c3d2c-10cf-54cc-445b-553a6c1156bb@gmail.com>
Date: Thu, 6 Jul 2017 15:35:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAOCHtYi1Ce-5=_fTuL2s+pC16VSbnYX6TR6QJD5gq_bpFn7kPQ@mail.gmail.com>
Subject: ./spidev_test -l ==> setup: unsupported mode bits 20 ?
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
X-List-Received-Date: Thu, 06 Jul 2017 07:35:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Dear Meta-TI Team Member,

I tried with -l parameter but it said
root@beaglebone:~# ./spidev_test -l spidev spi1.0: setup: unsupported 
mode bits 20
What is the cause ?

spidev spi1.0: setup: unsupported mode bits 20
can't set spi mode: Invalid argument
Aborted

Thanks,
Riko


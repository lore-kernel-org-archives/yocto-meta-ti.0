Return-Path: <kenny@understoryweather.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06CDDE00BD2; Fri, 14 Jul 2017 16:19:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.46 listed in dnsbl.sorbs.net]
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B491CE00BA1
	for <meta-ti@yoctoproject.org>; Fri, 14 Jul 2017 16:19:03 -0700 (PDT)
Received: by mail-vk0-f46.google.com with SMTP id r125so54263965vkf.1
	for <meta-ti@yoctoproject.org>; Fri, 14 Jul 2017 16:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=understoryweather-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=jrcyR72IBAAdlAhQi4cEC+femEXpHPo50Wj9qxf9JCg=;
	b=F2Os9v33Nj1P2suwGWgsK2eXqSwFsVR+Jc44gnxxIqhBG+yPVnqtQoFi8PTwRL70H/
	RMj+k9PjzuCMhh3RffCQlMxa1F59s+kKdKKU8t9jpxrzh9Iyq7FApdb79bGY2djZQCO1
	jRkDqa8Bqb3KwzOfbZaZH3ePR7dV5JsDU/FL+xrtPTikORkpUoHAIuj2wl4ppgnHo2ow
	xoKEKa78n+RvD26Jd0OcxhOqI5elF2uje9MkmyIpm/VUGSjr/3cGfEuaso/asUwWUSiP
	ztK/cMOcMLBj2a1DFtQxbuCqtSGDvmpHehvF9S4eE4Pf9Izv72Swte+jhchIsn/zrwcc
	3oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jrcyR72IBAAdlAhQi4cEC+femEXpHPo50Wj9qxf9JCg=;
	b=Squ7nlb5cDMum0S7CdCW2LD1a9DgOVYO+Ok+IBtLT6K565bf1WizvThfLRX9LgGVfq
	6hQgJPcyWYtXfG1cV1FIRRdOqQ/M1W+SbOq8+IsYyNF0T62PCDYWJD33ztwdzrut8uBT
	0X/zDPyrE0laSqexxm0hZ+Iym2XuKqYgzk2tkKRwQSmuindqg0ekeTCxYvCRIawPLN3T
	xGqrooJkGJFyKCfCYXi+mJlDgedyca0gIAzQcA2PfUzeeZh0tNwT2VlTjS/G9cqPcgwa
	iBpRsULujdYW9qptzw/p+W8dNIRGQCVDPQSLIV8jBwdqiTW5PsfyS8Awsg9SjhrqcgH0
	u4Cg==
X-Gm-Message-State: AIVw112dBpDvzlUKGpz9xvuruOzy8tcXhRmliIaN1ZAcS052ARyU3wcY
	rHg+Yi6AXXUAw03xNyqrIL81Hjs1wHld37o=
X-Received: by 10.31.66.141 with SMTP id p135mr5735949vka.85.1500074342743;
	Fri, 14 Jul 2017 16:19:02 -0700 (PDT)
MIME-Version: 1.0
From: Kenny Koller <kenny@understoryweather.com>
Date: Fri, 14 Jul 2017 23:18:51 +0000
Message-ID: <CAPtqgUxb=NqzZUj6L2aEdbhbO=uTZBHyL8j0820AqSe0Oaxsig@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: U-Boot 2017.01 uEnv.txt Resolution (Raw Mode)
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
X-List-Received-Date: Fri, 14 Jul 2017 23:19:07 -0000
Content-Type: multipart/alternative; boundary="001a1144b32656128e05544f4620"

--001a1144b32656128e05544f4620
Content-Type: text/plain; charset="UTF-8"

I'm attempting to use the raw mode to boot a Beaglebone Black. I've loaded
MLO and U-Boot at 128 kB and 384 kB and it successfully loads and runs
U-Boot but fails to find and load a uEnv.txt because I'm unsure where to
place it. I tried /boot on an EXT4 root filesystem.

I suppose raw mode is a PPL thing and there is no way for U-Boot to know
about this and it can only support one way of loading the environment
(which is to fatload from partition 1)?

I tried to resolve this in the Beaglebone community but I'm told that
documentation won't be applicable unless I apply a patch. But I'd prefer to
use the stock Yocto build.

I hope you don't mind fielding this question. It's not clear to me how much
of U-Boot is mainline from DENX, how much is from Robert Nelso, and how
much is from meta-ti.

Thanks.

--001a1144b32656128e05544f4620
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m attempting to use the raw mode to boot a Beaglebon=
e Black. I&#39;ve loaded MLO and U-Boot at 128 kB and 384 kB and it success=
fully loads and runs U-Boot but fails to find and load a uEnv.txt because I=
&#39;m unsure where to place it. I tried /boot on an EXT4 root filesystem.<=
div><br></div><div>I suppose raw mode is a PPL thing and there is no way fo=
r U-Boot to know about this and it can only support one way of loading the =
environment (which is to fatload from partition 1)?<br><div><br></div><div>=
I tried to resolve this in the Beaglebone community but I&#39;m told that d=
ocumentation won&#39;t be applicable unless I apply a patch. But I&#39;d pr=
efer to use the stock Yocto build.</div><div><br></div><div>I hope you don&=
#39;t mind fielding this question. It&#39;s not clear to me how much of U-B=
oot is mainline from DENX, how much is from Robert Nelso, and how much is f=
rom meta-ti.</div></div><div><br></div><div>Thanks.</div></div>

--001a1144b32656128e05544f4620--

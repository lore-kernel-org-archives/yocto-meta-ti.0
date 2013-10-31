Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E744E017BC
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 01:53:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9V8rGX7002604;
	Thu, 31 Oct 2013 03:53:16 -0500
Received: from DLEE71.ent.ti.com ([157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9V8rGZx010642;
	Thu, 31 Oct 2013 03:53:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 31 Oct 2013 03:53:16 -0500
Received: from [172.24.158.58] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9V8rEsZ026572;
	Thu, 31 Oct 2013 03:53:15 -0500
Message-ID: <52721A7A.9090307@ti.com>
Date: Thu, 31 Oct 2013 14:23:14 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Kai <skmaillist@gmail.com>
References: <CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com>	<52720EA6.8000108@ti.com>
	<CAEhSjjuOZUt=eNH+As_1dGPi_AgPtUrS+GmR2=32Q24qA=TG+g@mail.gmail.com>
In-Reply-To: <CAEhSjjuOZUt=eNH+As_1dGPi_AgPtUrS+GmR2=32Q24qA=TG+g@mail.gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Compile kernel with 4.8 toolchain
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
X-List-Received-Date: Thu, 31 Oct 2013 08:53:20 -0000
Content-Type: multipart/alternative;
	boundary="------------050702030701010003020800"

--------------050702030701010003020800
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 2:06 PM, Kai wrote:
> 4.8 toolchain is part of customer's requirement.
>
> It seems the kernel with 4.8 toolchain fails at very early stage, have 
> you met anything like this when you get 4.7 Linaro toolchain work with 
> 3.8.x kernel? maybe some configurations or build parameters are needed.

You could try to turn on DEBUG_LL and other DEBUG_* options to see if 
that helps in identifying the cause.

--
Sid


--------------050702030701010003020800
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 10/31/2013 2:06 PM, Kai wrote:<br>
    </div>
    <blockquote
cite="mid:CAEhSjjuOZUt=eNH+As_1dGPi_AgPtUrS+GmR2=32Q24qA=TG+g@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr">4.8 toolchain is part of customer's requirement.
        <div><br>
        </div>
        <div>It seems the kernel with 4.8 toolchain fails at very early
          stage, have you met anything like this when you get 4.7 Linaro
          toolchain work with 3.8.x kernel? maybe some configurations or
          build parameters are needed.</div>
      </div>
    </blockquote>
    <br>
    You could try to turn on DEBUG_LL and other DEBUG_* options to see
    if that helps in identifying the cause. <br>
    <br>
    --<br>
    Sid<br>
    <br>
  </body>
</html>

--------------050702030701010003020800--

Return-Path: <wmills@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A98A5E00746
	for <meta-ti@yoctoproject.org>; Tue, 12 Jun 2012 06:10:35 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q5CDAYPw012558;
	Tue, 12 Jun 2012 08:10:34 -0500
Received: from DFLE71.ent.ti.com (dfle71.ent.ti.com [128.247.5.62])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q5CDAY4p028143;
	Tue, 12 Jun 2012 08:10:34 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 12 Jun 2012 08:10:34 -0500
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.102.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q5CDAXKR012266;	Tue, 12 Jun 2012 08:10:33 -0500
Message-ID: <4FD73FC9.7010002@ti.com>
Date: Tue, 12 Jun 2012 09:10:33 -0400
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <20120612011706.GD30300@denix.org>
In-Reply-To: <20120612011706.GD30300@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2012 13:10:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2012 09:17 PM, Denys Dmytriyenko wrote:
> The initial split (which is still "work in progress"), following the above
> description (except the systemd for now) can be checked at:
>
> http://arago-project.org/git/?p=meta-ti.git;a=shortlog;h=refs/heads/split

I'm glad to see this work going.

I was surprised to see that the extra layer was embedded into the 
existing one.  Is that right?

When we talked before we spoke of two layers at the top level.

